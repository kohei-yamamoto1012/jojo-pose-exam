class CreateCheckItemResults < ActiveRecord::Migration[6.1]
  def change
    create_table :check_item_results do |t|
      t.belongs_to :exam_result, null: false
      t.belongs_to :check_item, null: false
      t.boolean :result, null: false, default: false

      t.timestamps
    end
  end
end
