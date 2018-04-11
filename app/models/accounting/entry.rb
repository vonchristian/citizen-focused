module Accounting
  class Entry < ApplicationRecord
    has_many :credit_amounts, extend: Accounting::BalanceFinder, :class_name => 'Accounting::CreditAmount', :inverse_of => :entry, dependent: :destroy
    has_many :debit_amounts, extend: Accounting::BalanceFinder, :class_name => 'Accounting::DebitAmount', :inverse_of => :entry, dependent: :destroy
    def self.table_name_prefix
      "accounting_"
    end
  end
end
