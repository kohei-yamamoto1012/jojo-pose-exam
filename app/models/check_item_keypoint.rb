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
class CheckItemKeypoint < ApplicationRecord
  belongs_to :keypoint
  belongs_to :check_item

  validates :position, presence: true

  enum position: {
    center: 1,
    left: 2,
    right: 3,
    top: 4,
    bottom: 5
  }
end
