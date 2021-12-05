class CreateCheckItems < ActiveRecord::Migration[6.1]
  def change
    create_table :check_items do |t|
      t.belongs_to :exam, null: false
      t.string :content, null: false
      t.integer :allocation, null: false
      t.integer :check_pattern, null: false

      t.timestamps
    end
  end
end
