class AddGroupToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :group, :string
  end
end
