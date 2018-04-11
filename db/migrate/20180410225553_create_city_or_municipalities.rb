class CreateCityOrMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :city_or_municipalities do |t|
      t.string :name

      t.timestamps
    end
    add_index :city_or_municipalities, :name, unique: true
  end
end
