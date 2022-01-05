class CreateExamResults < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :exam_results, id: :uuid do |t|
      t.belongs_to :exam, null: false
      t.belongs_to :exam_result_comment, null: false
      t.boolean :privacy_setting, null: false, default: true
      t.boolean :hide_face, null: false, default: false

      t.timestamps
    end
  end
end
