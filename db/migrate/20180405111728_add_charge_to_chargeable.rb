class AddChargeToChargeable < ActiveRecord::Migration[5.2]
  def change
    add_reference :chargeables, :charge, foreign_key: true
  end
end
