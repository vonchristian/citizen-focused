class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.integer :promo_type
      t.datetime :start_date
      t.datetime :end_date
      t.string :code

      t.timestamps
    end
    add_index :promotions, :promo_type
    add_index :promotions, :code, unique: true
  end
end
