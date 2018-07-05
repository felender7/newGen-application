class RenameColumnsFirtname < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :firts_name, :first_name
  end
end
