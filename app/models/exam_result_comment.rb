# == Schema Information
#
# Table name: exam_result_comments
#
#  id              :bigint           not null, primary key
#  content         :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  score_border_id :bigint           not null
#
# Indexes
#
#  index_exam_result_comments_on_score_border_id  (score_border_id)
#
class ExamResultComment < ApplicationRecord
  has_many :exam_result
  belongs_to :score_border

  with_options presence: true do
    validates :content
    validates :score_border
  end

  validates :content, length: { maximum: 100 }
end
