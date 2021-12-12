# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  description :string
#  path        :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Exam < ApplicationRecord
  has_many :check_items, dependent: :destroy
  has_many :exam_results, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :path
  end

  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 1000 }
end
