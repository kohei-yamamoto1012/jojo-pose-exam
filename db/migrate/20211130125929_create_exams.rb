class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
  end
end
