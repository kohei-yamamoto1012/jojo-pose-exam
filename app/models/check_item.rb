# == Schema Information
#
# Table name: check_items
#
#  id            :bigint           not null, primary key
#  allocation    :integer          not null
#  check_pattern :integer          not null
#  content       :string           not null
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

  with_options presence: true do
    validates :exam
    validates :content
    validates :allocation
    validates :check_pattern
  end

  validates :content, length: { maximum: 50 }
  validates :allocation, inclusion: { in: 0..100 }

  enum check_pattern: {
    nose_between_rl_hip: 1,
    r_elbow_angle_0to45: 2,
    l_elbow_angle_90to180: 3,
    rl_leg_angle_90to180: 4,
    r_knee_angle_135to225: 5,
    l_knee_angle_90to180: 6
  }
end
