class CreateBarangays < ActiveRecord::Migration[5.2]
  def change
    create_table :barangays do |t|
      t.belongs_to :city_or_municipality, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
