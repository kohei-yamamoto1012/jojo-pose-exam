# == Schema Information
#
# Table name: keypoints
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Keypoint < ApplicationRecord
  has_many :exam_result_keypoints, dependent: :destroy
  has_many :check_item_keypoints, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
