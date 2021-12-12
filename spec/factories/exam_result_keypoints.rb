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
#  exam_result_id :bigint           not null
#  keypoint_id    :bigint           not null
#
# Indexes
#
#  index_exam_result_keypoints_on_exam_result_id  (exam_result_id)
#  index_exam_result_keypoints_on_keypoint_id     (keypoint_id)
#
FactoryBot.define do
  factory :exam_result_keypoint do
    x_coordinate { 1 }
    y_coordinate { 1 }
    score { 1 }
  end
end
