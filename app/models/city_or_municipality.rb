class CityOrMunicipality < ApplicationRecord
  has_many :barangays
  has_many :businesses
end
