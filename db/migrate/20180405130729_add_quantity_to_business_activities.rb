class AddQuantityToBusinessActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :business_activities, :quantity, :decimal, default: 1
  end
end
