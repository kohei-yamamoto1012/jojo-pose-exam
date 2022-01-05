# == Schema Information
#
# Table name: check_item_results
#
#  id             :bigint           not null, primary key
#  result         :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  check_item_id  :bigint           not null
#  exam_result_id :uuid             not null
#
# Indexes
#
#  index_check_item_results_on_check_item_id   (check_item_id)
#  index_check_item_results_on_exam_result_id  (exam_result_id)
#
require 'rails_helper'

RSpec.describe CheckItemResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
