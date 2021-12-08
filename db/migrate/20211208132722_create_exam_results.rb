class CreateExamResults < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_results do |t|
      t.belongs_to :exam
      t.boolean :privacy_setting, null: false, default: true
      t.boolean :hide_face, null: false, default: false

      t.timestamps
    end
  end
end
