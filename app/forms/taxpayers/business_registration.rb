module Taxpayers
  class BusinessRegistration
    include ActiveModel::Model
    attr_accessor :name, :taxpayer_id
    def register!
      ActiveRecord::Base.transaction do
        save_business
      end
    end

    private
    def save_business
      business = Business.create(
        name: name)
      business.taxpayer_owners << find_taxpayer
    end
    def find_taxpayer
      Taxpayer.find_by_id(taxpayer_id)
    end
  end
end
