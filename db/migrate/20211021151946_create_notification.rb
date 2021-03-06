class CreateNotification < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :message
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
