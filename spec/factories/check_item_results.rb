# == Schema Information
#
# Table name: check_item_results
#
#  id             :bigint           not null, primary key
#  result         :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  check_item_id  :bigint           not null
#  exam_result_id :bigint           not null
#
# Indexes
#
#  index_check_item_results_on_check_item_id   (check_item_id)
#  index_check_item_results_on_exam_result_id  (exam_result_id)
#
FactoryBot.define do
  factory :check_item_result do
    result { false }
  end
end
