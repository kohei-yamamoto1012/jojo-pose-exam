class RemovePathFromExams < ActiveRecord::Migration[6.1]
  def change
    remove_column :exams, :path, :string
  end
end
