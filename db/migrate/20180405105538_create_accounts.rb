class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounting_accounts do |t|
      t.string :name
      t.integer :code
      t.boolean :contra
      t.string :type

      t.timestamps
    end
    add_index :accounting_accounts, :name, unique: true
    add_index :accounting_accounts, :code, unique: true
    add_index :accounting_accounts, :type
  end
end
