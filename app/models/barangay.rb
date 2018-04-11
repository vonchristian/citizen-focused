class Barangay < ApplicationRecord
  belongs_to :city_or_municipality
  has_many :businesses
end
