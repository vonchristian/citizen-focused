module Businesses
  class BusinessActivityProcessing
    include ActiveModel::Model
    attr_accessor :business_id, :activity_id, :quantity

    def process!
      ActiveRecord::Base.transaction do
        save_business_activity
      end
    end

    private
    def save_business_activity
      business_activity = find_business.business_activities.find_or_create_by(
        activity: find_activity,
        quantity: quantity)
      charge = find_activity.charge
      find_business.business_charges.create!(charge: charge)
    end

    def find_business
      Business.find_by_id(business_id)
    end
    def find_activity
      Activity.find_by_id(activity_id)
    end
  end
end
