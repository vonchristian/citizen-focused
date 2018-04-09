class AddCanBeDeferredToChargeables < ActiveRecord::Migration[5.2]
  def change
    add_column :chargeables, :can_be_deferred, :boolean, default: false
  end
end
