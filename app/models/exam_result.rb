class ExamResult < ApplicationRecord
  belongs_to :exam
  has_many :check_item_results
  has_many :check_items, through: :check_item_results
  has_many :exam_result_keypoints
end
