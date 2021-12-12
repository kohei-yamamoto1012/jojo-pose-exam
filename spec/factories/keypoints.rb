# == Schema Information
#
# Table name: keypoints
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :keypoint do
    name { "MyString" }
  end
end
