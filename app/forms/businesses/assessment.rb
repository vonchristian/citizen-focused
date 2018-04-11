module Businesses
  class Assessment
    include ActiveModel::Model
    attr_accessor :business_id, :date
    def save
      entry = Accounting::Entry.new(
      date: date,
      description: "Assessment of charges fo #{find_business.name}")
      find_business.charges.each do |charge|
        debit_amount = Accounting::DebitAmount.new(
          amount: charge.amount,
          account: charge.revenue_account,
          commercial_document: find_business)
        credit_amount = Accounting::CreditAmount.new(
          amount: charge.amount,
          account: charge.revenue_account,
          commercial_document: find_business)
        entry.debit_amounts << debit_amount
        entry.credit_amounts << credit_amount
      end
      entry.save!
    end
    def find_business
      Business.find_by_id(business_id)
    end
  end
end
