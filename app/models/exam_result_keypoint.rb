# == Schema Information
#
# Table name: exam_result_keypoints
#
#  id             :bigint           not null, primary key
#  score          :integer
#  x_coordinate   :integer
#  y_coordinate   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  exam_result_id :bigint
#  keypoint_id    :bigint
#
# Indexes
#
#  index_exam_result_keypoints_on_exam_result_id  (exam_result_id)
#  index_exam_result_keypoints_on_keypoint_id     (keypoint_id)
#
class ExamResultKeypoint < ApplicationRecord
  belongs_to :exam_result
  belongs_to :keypoint
end
