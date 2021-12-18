# == Schema Information
#
# Table name: exam_results
#
#  id              :bigint           not null, primary key
#  hide_face       :boolean          default(FALSE), not null
#  privacy_setting :boolean          default(TRUE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  exam_id         :bigint           not null
#
# Indexes
#
#  index_exam_results_on_exam_id  (exam_id)
#
class ExamResult < ApplicationRecord
  belongs_to :exam
  has_many :check_item_results, dependent: :destroy
  has_many :check_items, through: :check_item_results
  has_many :exam_result_keypoints, dependent: :destroy
  has_one_attached :upload_image

  with_options presence: true do
    validates :exam
    validates :check_item_results
    validates :exam_result_keypoints
  end

  validates :hide_face, inclusion: { in: [true, false] }
  validates :privacy_setting, inclusion: { in: [true, false] }

  attr_writer :exam_id, :privacy_setting, :hide_face, :exam_result_keypoints

  before_validation :set_exam,
                    :set_privacy_setting_default,
                    :set_hide_face_default,
                    :set_exam_result_keypoints,
                    :set_check_item_results

  def set_exam
    return unless @exam_id

    self.exam = Exam.find(@exam_id)
  end

  def set_privacy_setting_default
    return unless @privacy_setting

    self.privacy_setting = @privacy_setting
  end

  def set_hide_face_default
    return unless @hide_face

    self.hide_face = @hide_face
  end

  def set_exam_result_keypoints
    return unless @exam_result_keypoints

    @exam_result_keypoints.each do |keypoint|
      exam_result_keypoint = ExamResultKeypoint.new(
        keypoint: Keypoint.find_by(name: keypoint['name']),
        x_coordinate: keypoint['x_coordinate'],
        y_coordinate: keypoint['y_coordinate'],
        score: keypoint['score']
      )
      exam_result_keypoints << exam_result_keypoint
    end
  end

  def set_check_item_results
    return unless @exam_result_keypoints

    exam.check_items.each do |check_item|
      check_item_result = CheckItemResult.new(check_item: check_item)
      check_item_result.correct_false_judge(@exam_result_keypoints)
      check_item_results << check_item_result
    end
  end

  def upload_image_url
    upload_image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(upload_image, only_path: true) : nil
  end

  def total_score
    score = 0
    check_item_results.each do |check_item_result|
      score += check_item_result.check_item.allocation if check_item_result.result
    end
    return score
  end
end
