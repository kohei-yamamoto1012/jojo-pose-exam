class CreateExamResultComments < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_result_comments do |t|
      t.belongs_to :score_border, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
