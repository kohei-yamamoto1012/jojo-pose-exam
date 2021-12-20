class CreateScoreBorders < ActiveRecord::Migration[6.1]
  def change
    create_table :score_borders do |t|
      t.integer :score, null: false

      t.timestamps
    end
  end
end
