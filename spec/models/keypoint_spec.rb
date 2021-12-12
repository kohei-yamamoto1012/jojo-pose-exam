# == Schema Information
#
# Table name: keypoints
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Keypoint, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
