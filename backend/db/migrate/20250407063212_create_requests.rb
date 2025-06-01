class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :leasing_term, null: false
      t.string :payment_type, null: false
      t.string :status, null: false
      t.string :conditions
      t.jsonb :verification_result, default: {}
      t.belongs_to :user
      t.belongs_to :client
      t.belongs_to :vehicle

      t.timestamps
    end
  end
end
