class Keypoint < ApplicationRecord
  has_many :exam_result_keypoints, dependent: :destroy
end
