class RemoveChargeFromChargeables < ActiveRecord::Migration[5.2]
  def change
    remove_reference :chargeables, :charge, polymorphic: true
  end
end
