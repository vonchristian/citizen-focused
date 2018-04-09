module Accounting
  class Account < ApplicationRecord

    def self.table_name_prefix
      'accounting_'
    end
  end
end
