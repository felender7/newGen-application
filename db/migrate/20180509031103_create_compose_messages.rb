class CreateComposeMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :compose_messages do |t|
      t.string :recipient
      t.text :message

      t.timestamps
    end
  end
end
