class CheckItem < ApplicationRecord
  belongs_to :exam
  has_many :check_item_results
  has_many :exam_results, through: :check_item_results

  validates :exam, presence: true
  validates :content, presence: true
  validates :allocation, presence: true
  validates :check_pattern, presence: true
end
