module Taxpayers
  class BusinessRegistration
    include ActiveModel::Model
    attr_accessor :name, :taxpayer_id, :mode_of_payment_id,
    :building_number, :street, :barangay, :city_or_municipality, :province
    def register!
      ActiveRecord::Base.transaction do
        save_business
      end
    end
    def find_business
      Business.find_by(name: name)
    end

    private
    def save_business
      business = Business.create!(
        name: name,
        mode_of_payment_id: mode_of_payment_id,
        city_or_municipality: find_city_or_municipality,
        barangay: find_barangay)
      business.taxpayer_owners << find_taxpayer
      business.addresses.create(
        building_number: building_number,
        street: street,
        barangay: barangay,
        city_or_municipality: city_or_municipality,
        province: province)
    end
    def find_taxpayer
      Taxpayer.find_by_id(taxpayer_id)
    end
    def find_city_or_municipality
      CityOrMunicipality.find_by(name: city_or_municipality)
    end
    def find_barangay
      find_city_or_municipality.barangays.find_by(name: barangay)
    end
  end
end
