class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :accounting_entries do |t|
      t.datetime :date
      t.string :reference_number
      t.string :description
      t.references :commercial_document, polymorphic: true, index: { name: "index_commercial_document_on_entries" }

      t.timestamps
    end
    add_index :accounting_entries, :reference_number, unique: true
  end
end
