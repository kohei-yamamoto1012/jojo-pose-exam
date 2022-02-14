# == Schema Information
#
# Table name: check_item_results
#
#  id             :bigint           not null, primary key
#  result         :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  check_item_id  :bigint           not null
#  exam_result_id :uuid             not null
#
# Indexes
#
#  index_check_item_results_on_check_item_id   (check_item_id)
#  index_check_item_results_on_exam_result_id  (exam_result_id)
#
class CheckItemResult < ApplicationRecord
  require 'matrix'
  belongs_to :exam_result
  belongs_to :check_item

  with_options presence: true do
    validates :exam_result
    validates :check_item
  end

  validates :result, inclusion: { in: [true, false] }

  def correct_false_judge(exam_result_keypoints)
    self.result =
      case check_item.check_pattern

      when 'keypoints_horizontal'
        keypoints_horizontal?(exam_result_keypoints)

      when 'keypoints_vertical'
        keypoints_vertical?(exam_result_keypoints)

      when 'keypoints_angle'
        keypoints_angle?(exam_result_keypoints)

      end

    self
  end

  private

  def extracted_exam_result_keypoint(exam_result_keypoints, position_name)
    keypoint = check_item.check_item_keypoints.find { |n| n.position == position_name }.keypoint
    exam_result_keypoints.find { |n| n.keypoint == keypoint }
  end

  def keypoints_horizontal?(exam_result_keypoints)
    center_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'center')
    left_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'left')
    right_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'right')

    center_keypoint.x_coordinate > left_keypoint.x_coordinate && center_keypoint.x_coordinate < right_keypoint.x_coordinate
  end

  def keypoints_vertical?(exam_result_keypoints)
    center_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'center')
    top_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'top')
    bottom_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'bottom')

    center_keypoint.y_coordinate > top_keypoint.y_coordinate && center_keypoint.y_coordinate < bottom_keypoint.y_coordinate
  end

  def calc_keypoints_angle(vertex_keypoint, side_a_keypoint, side_b_keypoint)
    vector_a = Vector[
      vertex_keypoint.x_coordinate - side_a_keypoint.x_coordinate,
      vertex_keypoint.y_coordinate - side_a_keypoint.y_coordinate
    ]

    vector_b = Vector[
      vertex_keypoint.x_coordinate - side_b_keypoint.x_coordinate,
      vertex_keypoint.y_coordinate - side_b_keypoint.y_coordinate
    ]

    (vector_a.angle_with(vector_b) * 180 / Math::PI).round
  end

  def keypoints_angle?(exam_result_keypoints)
    vertex_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'center')
    side_a_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'left')
    side_b_keypoint = extracted_exam_result_keypoint(exam_result_keypoints, 'right')

    angle = calc_keypoints_angle(vertex_keypoint, side_a_keypoint, side_b_keypoint)
    angle >= check_item.min_angle && angle <= check_item.max_angle
  end
end
