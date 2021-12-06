class Exam < ApplicationRecord
  has_many :check_items, dependent: :destroy

  validates :title, presence: true
  validates :path, presence: true
end
