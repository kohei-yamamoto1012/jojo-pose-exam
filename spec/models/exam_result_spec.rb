# == Schema Information
#
# Table name: exam_results
#
#  id              :bigint           not null, primary key
#  hide_face       :boolean          default(FALSE), not null
#  privacy_setting :boolean          default(TRUE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  exam_id         :bigint
#
# Indexes
#
#  index_exam_results_on_exam_id  (exam_id)
#
require 'rails_helper'

RSpec.describe ExamResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
