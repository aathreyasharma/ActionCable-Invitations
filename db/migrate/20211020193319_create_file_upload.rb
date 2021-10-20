class CreateFileUpload < ActiveRecord::Migration[6.1]
  def change
    create_table :file_uploads do |t|
      t.string :file_name
      t.references :created_by, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
