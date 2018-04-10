module Taxpayers
  class BusinessRegistration
    include ActiveModel::Model
    attr_accessor :name, :taxpayer_id, :mode_of_payment_id
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
        supporter: find_supporter)
      business.taxpayer_owners << find_taxpayer
    end
    def find_taxpayer
      Taxpayer.find_by_id(taxpayer_id)
    end
    def find_supporter
      Subscriber.last
    end
  end
end
