class CreateCheckItemKeypoints < ActiveRecord::Migration[6.1]
  def change
    create_table :check_item_keypoints do |t|
      t.belongs_to :keypoint, null: false
      t.belongs_to :check_item, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
