# == Schema Information
#
# Table name: check_item_results
#
#  id             :bigint           not null, primary key
#  result         :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  check_item_id  :bigint           not null
#  exam_result_id :bigint           not null
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

  def correct_false_judge(keypoints)
    self.result =
      case check_item.check_pattern

      when 'nose_between_rl_hip'
        nose = keypoints.find { |n| n['name'] == 'nose' }
        right_hip = keypoints.find { |n| n['name'] == 'right_hip' }
        left_hip = keypoints.find { |n| n['name'] == 'left_hip' }

        between_horizontal?(
          center_keypoint: nose,
          left_keypoint: right_hip,
          right_keypoint: left_hip
        )

      when 'r_elbow_angle_0to45'
        right_elbow = keypoints.find { |n| n['name'] == 'right_elbow' }
        right_wrist = keypoints.find { |n| n['name'] == 'right_wrist' }
        right_shoulder = keypoints.find { |n| n['name'] == 'right_shoulder' }

        angle_correct?(
          vertex_keypoint: right_elbow,
          side_a_keypoint: right_wrist,
          side_b_keypoint: right_shoulder,
          min_angle: 0,
          max_angle: 45
        )

      when 'l_elbow_angle_90to180'
        left_elbow = keypoints.find { |n| n['name'] == 'left_elbow' }
        left_wrist = keypoints.find { |n| n['name'] == 'left_wrist' }
        left_shoulder = keypoints.find { |n| n['name'] == 'left_shoulder' }

        angle_correct?(
          vertex_keypoint: left_elbow,
          side_a_keypoint: left_wrist,
          side_b_keypoint: left_shoulder,
          min_angle: 90,
          max_angle: 180
        )

      when 'rl_leg_angle_90to180'
        right_hip = keypoints.find { |n| n['name'] == 'right_hip' }
        right_knee = keypoints.find { |n| n['name'] == 'right_knee' }
        left_hip = keypoints.find { |n| n['name'] == 'left_hip' }
        left_knee = keypoints.find { |n| n['name'] == 'left_knee' }

        angle_correct?(
          vertex_keypoint: right_hip,
          side_a_keypoint: right_knee,
          side_b_keypoint: left_hip,
          min_angle: 90,
          max_angle: 180
        ) &&
        angle_correct?(
          vertex_keypoint: left_hip,
          side_a_keypoint: left_knee,
          side_b_keypoint: right_hip,
          min_angle: 90,
          max_angle: 180
        )

      when 'r_knee_angle_135to225'
        right_knee = keypoints.find { |n| n['name'] == 'right_knee' }
        right_hip = keypoints.find { |n| n['name'] == 'right_hip' }
        right_ankle = keypoints.find { |n| n['name'] == 'right_ankle' }

        angle_correct?(
          vertex_keypoint: right_knee,
          side_a_keypoint: right_hip,
          side_b_keypoint: right_ankle,
          min_angle: 135,
          max_angle: 225
        )

      when 'l_knee_angle_90to180'
        left_knee = keypoints.find { |n| n['name'] == 'left_knee' }
        left_hip = keypoints.find { |n| n['name'] == 'left_hip' }
        left_ankle = keypoints.find { |n| n['name'] == 'left_ankle' }

        angle_correct?(
          vertex_keypoint: left_knee,
          side_a_keypoint: left_hip,
          side_b_keypoint: left_ankle,
          min_angle: 90,
          max_angle: 180
        )
      end

    self
  end

  private

  def between_horizontal?(center_keypoint:, left_keypoint:, right_keypoint:)
    center_keypoint['x_coordinate'] > left_keypoint['x_coordinate'] && center_keypoint['x_coordinate'] < right_keypoint['x_coordinate']
  end

  def angle_correct?(vertex_keypoint:, side_a_keypoint:, side_b_keypoint:, min_angle:, max_angle:)
    a1 = vertex_keypoint['x_coordinate'] - side_a_keypoint['x_coordinate']
    a2 = vertex_keypoint['y_coordinate'] - side_a_keypoint['y_coordinate']
    vector_a = Vector[a1, a2]

    b1 = vertex_keypoint['x_coordinate'] - side_b_keypoint['x_coordinate']
    b2 = vertex_keypoint['y_coordinate'] - side_b_keypoint['y_coordinate']
    vector_b = Vector[b1, b2]

    angle = (vector_a.angle_with(vector_b) * 180 / Math::PI).round
    angle >= min_angle && angle <= max_angle
  end
end