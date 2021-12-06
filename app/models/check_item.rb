class CheckItem < ApplicationRecord
  belongs_to :exam

  validates :exam, presence: true
  validates :content, presence: true
  validates :allocation, presence: true
  validates :check_pattern, presence: true
end
