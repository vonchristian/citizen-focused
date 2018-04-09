class CreateGrossSaleCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :gross_sale_charges do |t|
      t.belongs_to :charge, foreign_key: true
      t.belongs_to :gross_sale, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
