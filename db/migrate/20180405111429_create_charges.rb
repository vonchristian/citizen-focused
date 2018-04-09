class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :name
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounting_accounts }
      t.integer :charge_type
      t.belongs_to :accounts_receivable_account, foreign_key: { to_table: :accounting_accounts }
      t.decimal :amount
      t.decimal :rate

      t.timestamps
    end
    add_index :charges, :charge_type
  end
end
