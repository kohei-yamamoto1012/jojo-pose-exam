class Exam < ApplicationRecord
  validates :title, presence: true
  validates :path, presence: true
end
