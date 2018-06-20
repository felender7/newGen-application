class CreateRequestForms < ActiveRecord::Migration[5.1]
  def change
    create_table :request_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
