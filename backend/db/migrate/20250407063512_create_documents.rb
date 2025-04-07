class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.string :file
      t.integer :type
      t.jsonb :data, default: {}
      t.belongs_to :client
    end
  end
end
