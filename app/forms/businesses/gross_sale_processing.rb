module Businesses
  class GrossSaleProcessing
    include ActiveModel::Model
    attr_accessor :gross_sale, :start_date, :end_date, :date_entered, :business_id

    def process!
      ActiveRecord::Base.transaction do
        save_gross_sales
      end
    end

    def save_gross_sales
      gross_sale = find_business.gross_sales.create(
        gross_sale:   gross_sale,
        start_date:   start_date,
        end_date:     end_date,
        date_entered: date_entered)
      compute_tax(gross_sale)
    end
    def compute_tax(gross_sale)
      revenue_account = Accounting::Revenue.find_by(name: "Business Taxes")
      charge = Charge.create(
        name:            "Business Tax",
        revenue_account: revenue_account,
        amount: amount_for(gross_sale))
      find_business.business_charges.create(charge: charge, can_be_deferred: true)
    end
    def amount_for(gross_sale)
      100
    end
    def find_business
      Business.find_by_id(business_id)
    end
  end
end
