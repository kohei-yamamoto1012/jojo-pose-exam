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

  validates :title, presence: true
  validates :path, presence: true
end
