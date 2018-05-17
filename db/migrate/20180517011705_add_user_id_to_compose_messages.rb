class AddUserIdToComposeMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :compose_messages, :user_id, :integer
    add_index  :compose_messages, :user_id
  end
end
