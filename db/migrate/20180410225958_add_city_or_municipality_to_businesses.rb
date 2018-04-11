class AddCityOrMunicipalityToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :city_or_municipality, foreign_key: true
  end
end
