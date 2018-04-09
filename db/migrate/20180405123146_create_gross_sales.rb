class CreateGrossSales < ActiveRecord::Migration[5.2]
  def change
    create_table :gross_sales do |t|
      t.decimal :gross_sale
      t.belongs_to :business, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :date_entered

      t.timestamps
    end
  end
end
