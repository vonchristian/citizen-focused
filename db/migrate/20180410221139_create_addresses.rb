class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :building_number
      t.string :street
      t.string :barangay
      t.string :city_or_municipality
      t.string :province

      t.timestamps
    end
  end
end
