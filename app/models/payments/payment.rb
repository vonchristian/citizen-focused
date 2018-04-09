module Payments
  class Payment
    def for(payee, charge)
      charge.revenue_account.where(commercial_document: payee)
    end
    def paid?(payee, ar)
    end
  end
end
 #if annually?
 #total_payment
 #if semi_annually?
 #total_payment / 2
 #if quarterly?
 #total_payment / 4
