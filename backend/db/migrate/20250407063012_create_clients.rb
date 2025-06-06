class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :passport_series, null: false
      t.string :passport_number, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.belongs_to :user
    end
  end
end
