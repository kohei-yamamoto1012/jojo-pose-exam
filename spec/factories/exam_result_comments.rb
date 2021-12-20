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
FactoryBot.define do
  factory :exam_result_comment do
    content { "MyString" }
    score_border { 1 }
  end
end
