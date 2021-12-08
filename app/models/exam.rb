class Exam < ApplicationRecord
  has_many :check_items, dependent: :destroy
  has_many :exam_results, default: :destroy

  validates :title, presence: true
  validates :path, presence: true
end
