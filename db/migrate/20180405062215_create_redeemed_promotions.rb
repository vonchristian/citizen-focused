class CreateRedeemedPromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :redeemed_promotions do |t|
      t.references :redeemer, polymorphic: true
      t.belongs_to :promotion, foreign_key: true

      t.timestamps
    end
  end
end
