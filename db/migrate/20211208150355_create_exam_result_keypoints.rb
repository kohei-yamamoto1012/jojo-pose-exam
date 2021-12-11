class CreateExamResultKeypoints < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_result_keypoints do |t|
      t.belongs_to :exam_result
      t.belongs_to :keypoint
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.integer :score

      t.timestamps
    end
  end
end
