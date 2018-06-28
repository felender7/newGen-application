class AddAvatorToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :avator, :string
  end
end
