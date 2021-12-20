# == Schema Information
#
# Table name: score_borders
#
#  id         :bigint           not null, primary key
#  score      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ScoreBorder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
