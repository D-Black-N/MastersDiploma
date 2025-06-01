class AddRiskLevelToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :risk_level, :string
  end
end
