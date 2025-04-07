class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :role, null: false
      t.string :login, null: false, unique: true
      t.string :encrypted_password, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name, null: false
    end
  end
end
