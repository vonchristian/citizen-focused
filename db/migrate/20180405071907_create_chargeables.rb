class CreateChargeables < ActiveRecord::Migration[5.2]
  def change
    create_table :chargeables do |t|
      t.references :charged, polymorphic: true
      t.references :charge, polymorphic: true

      t.timestamps
    end
  end
end
