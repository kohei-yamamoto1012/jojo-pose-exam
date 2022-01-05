class CreateExamResultKeypoints < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_result_keypoints do |t|
      t.belongs_to :exam_result, type: :uuid, null: false
      t.belongs_to :keypoint, null: false
      t.integer :x_coordinate, null: false
      t.integer :y_coordinate, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
