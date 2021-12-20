# == Schema Information
#
# Table name: score_borders
#
#  id         :bigint           not null, primary key
#  score      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :score_border do
    score { 1 }
  end
end
