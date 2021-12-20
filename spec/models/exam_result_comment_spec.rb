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
require 'rails_helper'

RSpec.describe ExamResultComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
