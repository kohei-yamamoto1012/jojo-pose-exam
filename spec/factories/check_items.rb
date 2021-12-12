# == Schema Information
#
# Table name: check_items
#
#  id            :bigint           not null, primary key
#  allocation    :integer          not null
#  check_pattern :integer          not null
#  content       :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  exam_id       :bigint           not null
#
# Indexes
#
#  index_check_items_on_exam_id  (exam_id)
#
FactoryBot.define do
  factory :check_item do
    exam { nil }
    cntent { "MyString" }
    allocation { "" }
    check_pattern { "" }
  end
end
