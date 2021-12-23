# == Schema Information
#
# Table name: score_borders
#
#  id         :bigint           not null, primary key
#  score      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ScoreBorder < ApplicationRecord
  has_many :exam_result_comments, dependent: :destroy

  validates :score, presence: true
  validates :score, inclusion: { in: 0..100 }
end
