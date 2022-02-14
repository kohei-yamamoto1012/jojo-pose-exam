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
require 'rails_helper'

RSpec.describe CheckItemKeypoint, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
