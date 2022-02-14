# == Schema Information
#
# Table name: check_items
#
#  id            :bigint           not null, primary key
#  allocation    :integer          not null
#  check_pattern :integer          not null
#  content       :string           not null
#  max_angle     :integer          not null
#  min_angle     :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exam_id       :bigint           not null
#
# Indexes
#
#  index_check_items_on_exam_id  (exam_id)
#
class CheckItem < ApplicationRecord
  belongs_to :exam
  has_many :check_item_results, dependent: :destroy
  has_many :exam_results, through: :check_item_results
  has_many :check_item_keypoints, dependent: :destroy
  has_many :keypoints, through: :check_item_keypoints

  with_options presence: true do
    validates :exam
    validates :content
    validates :allocation
    validates :min_angle
    validates :max_angle
    validates :check_pattern
  end

  validates :content, length: { maximum: 50 }
  validates :allocation, inclusion: { in: 0..100 }

  enum check_pattern: {
    keypoints_horizontal: 1,
    keypoints_vertical: 2,
    keypoints_angle: 3
  }
end
