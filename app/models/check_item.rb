class CheckItem < ApplicationRecord
  belongs_to :exam
  has_many :check_item_results, dependent: :destroy
  has_many :exam_results, through: :check_item_results

  validates :exam, presence: true
  validates :content, presence: true
  validates :allocation, presence: true
  validates :check_pattern, presence: true

  enum check_pattern: {
    nose_between_rl_hip: 1,
    r_elbow_angle_0to45: 2,
    l_elbow_angle_90to180: 3,
    rl_leg_angle_90to180: 4,
    r_knee_angle_135to225: 5,
    l_knee_angle_90to180: 6
  }
end
