# == Schema Information
#
# Table name: exam_results
#
#  id                     :uuid             not null, primary key
#  hide_face              :boolean          default(FALSE), not null
#  privacy_setting        :boolean          default(TRUE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  exam_id                :bigint           not null
#  exam_result_comment_id :bigint           not null
#
# Indexes
#
#  index_exam_results_on_exam_id                 (exam_id)
#  index_exam_results_on_exam_result_comment_id  (exam_result_comment_id)
#
FactoryBot.define do
  factory :exam_result do
    privacy_setting { false }
    hide_face { false }
  end
end
