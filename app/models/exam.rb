class Exam < ApplicationRecord
  has_many :check_items

  validates :title, presence: true
  validates :path, presence: true
end
