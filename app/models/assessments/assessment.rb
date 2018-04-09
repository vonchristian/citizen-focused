module Assessments
  class Assessment
    def for(assessed, charge)
      charge.accounts_receivable_account.
      debit_amounts.where(commercial_document: assessed)
    end
  end
end
