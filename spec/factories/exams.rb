# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  description :string
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :exam do
    title { "MyString" }
    description { "MyString" }
  end
end
