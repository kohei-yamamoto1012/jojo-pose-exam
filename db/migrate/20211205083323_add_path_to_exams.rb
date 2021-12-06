class AddPathToExams < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :path, :string, null: false
  end
end
