class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :leasing_term, null: false
      t.integer :payment_type, null: false
      t.integer :status, null: false
      t.string :conditions
      t.jsonb :verification_result, default: {}
      t.belongs_to :user
      t.belongs_to :client
      t.belongs_to :vehicle
    end
  end
end
