class RenameManagedByColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :managed_by, :managed_by_id
  end
end
