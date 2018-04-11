module Businesses
  module PaymentChannels
    class OverTheCounterPaymentProcessing
      include ActiveModel::Model
      attr_accessor :date
      def save
        save_payment
      end

      private
      def save_payment
        entry = Accounting::Entry.new(
          date: date,
          description: "Payment of fees, taxes and charges of #{find_business.name}"
          )
        find_business.charges.each do |charge|
          debit_amount = Accounting::DebitAmount.new(
            amount: charge.amount,
            account: charge.accounts_receivable_account,
            commercial_document: find_business)
          credit_amount = Accounting::CreditAmount.new(
            amount: charge.amount,
            account: employee.cash_on_hand_account,
            commercial_document: find_business)
          entry.debit_amounts << debit_amount
          entry.credit_amounts << credit_amount
        end
        entry.save
        generate_offical_receipt(entry)
      end
      def generate_official_receipt(entry)
        OfficialReceipt.create(
          receiptable: entry,
          date: date)
    end
  end
end
