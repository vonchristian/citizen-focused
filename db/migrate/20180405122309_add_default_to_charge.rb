class AddDefaultToCharge < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :default_charge, :boolean, default: false
  end
end
