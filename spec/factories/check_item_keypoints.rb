# == Schema Information
#
# Table name: check_item_keypoints
#
#  id            :bigint           not null, primary key
#  position      :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  check_item_id :bigint           not null
#  keypoint_id   :bigint           not null
#
# Indexes
#
#  index_check_item_keypoints_on_check_item_id  (check_item_id)
#  index_check_item_keypoints_on_keypoint_id    (keypoint_id)
#
FactoryBot.define do
  factory :check_item_keypoint do
    position { 1 }
  end
end
