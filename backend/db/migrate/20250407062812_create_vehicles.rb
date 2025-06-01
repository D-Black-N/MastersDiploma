class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :brand, null: false
      t.string :vehicle_model, null: false
      t.string :year, null: false
      t.string :status, null: false
      t.string :vin, null: false
      t.integer :price, null: false, default: 0
    end
  end
end
