# == Schema Information
#
# Table name: exam_result_keypoints
#
#  id             :bigint           not null, primary key
#  score          :integer          not null
#  x_coordinate   :integer          not null
#  y_coordinate   :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  exam_result_id :uuid             not null
#  keypoint_id    :bigint           not null
#
# Indexes
#
#  index_exam_result_keypoints_on_exam_result_id  (exam_result_id)
#  index_exam_result_keypoints_on_keypoint_id     (keypoint_id)
#
class ExamResultKeypoint < ApplicationRecord
  belongs_to :exam_result
  belongs_to :keypoint

  with_options presence: true do
    validates :score
    validates :x_coordinate
    validates :y_coordinate
    validates :exam_result
    validates :keypoint
  end

  validates :x_coordinate, inclusion: { in: 0..9999 }
  validates :y_coordinate, inclusion: { in: 0..9999 }
  validates :score, inclusion: { in: 0..100 }
end
