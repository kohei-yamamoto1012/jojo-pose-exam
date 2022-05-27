# == Schema Information
#
# Table name: exam_results
#
#  id                     :uuid             not null, primary key
#  hide_face              :boolean          default(FALSE), not null
#  privacy_setting        :boolean          default(TRUE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  exam_id                :bigint           not null
#  exam_result_comment_id :bigint           not null
#
# Indexes
#
#  index_exam_results_on_exam_id                 (exam_id)
#  index_exam_results_on_exam_result_comment_id  (exam_result_comment_id)
#
class ExamResult < ApplicationRecord
  belongs_to :exam
  belongs_to :exam_result_comment
  has_many :check_item_results, dependent: :destroy
  has_many :check_items, through: :check_item_results
  has_many :exam_result_keypoints, dependent: :destroy
  has_one_attached :upload_image

  with_options presence: true do
    validates :exam
    validates :check_item_results
    validates :exam_result_keypoints
    validates :exam_result_comment
  end

  validates :hide_face, inclusion: { in: [true, false] }
  validates :privacy_setting, inclusion: { in: [true, false] }

  attr_writer :upload_image_vips, :upload_image_name

  before_validation :set_exam,
                    :set_privacy_setting_default,
                    :set_hide_face_default,
                    :set_exam_result_keypoints,
                    :set_check_item_results,
                    :set_exam_result_comment,
                    :attach_webp_image

  ML_MODEL_PATH = 'app/ml_models/movenet_singlepose_lightning_4.onnx'.freeze
  INPUT_IMG_WIDTH = 192
  INPUT_IMG_HEIGHT = 192
  ATTACH_IMG_WIDTH = 1008

  def set_exam
    return unless exam_id

    self.exam = Exam.find(exam_id)
  end

  def set_privacy_setting_default
    return if privacy_setting

    self.privacy_setting = true
  end

  def set_hide_face_default
    return if hide_face

    self.hide_face = false
  end

  def set_exam_result_keypoints
    return unless @upload_image_vips

    img = @upload_image_vips
    results = estimate_pose(img)
    normalized_results = normalize_results(results, img.height, img.width)

    normalized_results.each_with_index do |keypoint, index|
      exam_result_keypoint = ExamResultKeypoint.new(
        keypoint: Keypoint.find(index + 1),
        x_coordinate: keypoint[:x_coordinate],
        y_coordinate: keypoint[:y_coordinate],
        score: keypoint[:score]
      )
      exam_result_keypoints << exam_result_keypoint
    end
  end

  def set_check_item_results
    return unless exam_result_keypoints

    exam.check_items.each do |check_item|
      check_item_result = CheckItemResult.new(check_item: check_item)
      check_item_result.correct_false_judge(exam_result_keypoints)
      check_item_results << check_item_result
    end
  end

  def set_exam_result_comment
    return if exam_result_comment # 既にコメントが紐付いていればreturn

    comment_score_border = ScoreBorder.first
    ScoreBorder.all.find_each do |score_border|
      if total_score <= score_border.score
        comment_score_border = score_border
        break
      end
    end
    self.exam_result_comment = ExamResultComment.where(score_border: comment_score_border).sample
  end

  def attach_webp_image
    return unless @upload_image_vips

    aspect_height = @upload_image_vips.height.to_f / @upload_image_vips.width
    img = @upload_image_vips.thumbnail_image(ATTACH_IMG_WIDTH, height: ATTACH_IMG_WIDTH * aspect_height)

    tmp_save_path = Rails.root.join('tmp', @upload_image_name).to_s
    img.webpsave(tmp_save_path)
    upload_image.attach(io: File.open(tmp_save_path), filename: @upload_image_name, content_type: 'image/webp')
  end

  def upload_image_url
    upload_image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(upload_image, only_path: true) : nil
  end

  def total_score
    score = 0
    check_item_results.each do |check_item_result|
      score += check_item_result.check_item.allocation if check_item_result.result
    end
    score
  end

  def pass_or_fail_text
    if self.total_score >= 80
      '合格ッ！！'
    else
      '不合格！！'
    end

  end

  def delete_tmp_image
    return unless @upload_image_name

    tmp_save_path = Rails.root.join('tmp', @upload_image_name).to_s
    File.delete(tmp_save_path) if File.exist?(tmp_save_path)
  end

  private

  def estimate_pose(img)
    input = preprocess(img)
    model = OnnxRuntime::Model.new(Rails.root.join(ML_MODEL_PATH))
    model.predict({ 'input' => [input] })['output_0'][0][0]
  end

  def preprocess(img)
    img = img[0..2] if img.bands > 3
    img_resize = img.thumbnail_image(INPUT_IMG_WIDTH, height: INPUT_IMG_HEIGHT) # アスペクト比を保持しつつ変換
    img_resize = img_resize.embed(0, 0, INPUT_IMG_WIDTH, INPUT_IMG_HEIGHT, extend: :black) # 正方形に0埋め
    img_resize.to_a
  end

  def normalize_results(results, img_height, img_width)
    x_pad = img_height > img_width ? (img_height - img_width) : 0
    y_pad = img_width > img_height ? (img_width - img_height) : 0

    normalized_results = []
    results.each do |result|
      normalized_result = {
        x_coordinate: (result[1] * (img_width + x_pad)).round,
        y_coordinate: (result[0] * (img_height + y_pad)).round,
        score: (result[2] * 100).round
      }
      normalized_results.push(normalized_result)
    end

    normalized_results
  end
end
