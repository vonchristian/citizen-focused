class CreateModeOfPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :mode_of_payments do |t|
      t.string :name
      t.decimal :no_of_payments_per_year

      t.timestamps
    end
    add_index :mode_of_payments, :name, unique: true
  end
end
