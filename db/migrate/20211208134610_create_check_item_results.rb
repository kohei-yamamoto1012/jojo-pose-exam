class CreateCheckItemResults < ActiveRecord::Migration[6.1]
  def change
    create_table :check_item_results do |t|
      t.belongs_to :exam_result
      t.belongs_to :check_item
      t.boolean :result, null: false, default: false

      t.timestamps
    end
  end
end
