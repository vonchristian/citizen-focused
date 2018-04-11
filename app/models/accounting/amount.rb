module Accounting
  class Amount < ApplicationRecord
    belongs_to :account
    belongs_to :entry
    belongs_to :commercial_document, polymorphic: true
    delegate :name, to: :account, prefix: true
    def self.table_name_prefix
      'accounting_'
    end
  end
end
