class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounting_amounts do |t|
      t.belongs_to :account, foreign_key: { to_table: :accounting_accounts }
      t.belongs_to :entry, foreign_key: { to_table: :accounting_entries }
      t.string :type
      t.references :commercial_document, polymorphic: true, index: { name: "index_commercial_document_on_amounts"}
      t.decimal :amount

      t.timestamps
    end
    add_index :accounting_amounts, :type
    add_index :accounting_amounts, [:account_id, :entry_id]
    add_index :accounting_amounts, [:entry_id, :account_id]

  end
end
