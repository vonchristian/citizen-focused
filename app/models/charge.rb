class Charge < ApplicationRecord
  enum charge_type: [:fixed_amount, :percentage]
  belongs_to :revenue_account, class_name: "Accounting::Revenue"
  belongs_to :accounts_receivable_account, optional: true
  belongs_to :penalty_account, optional: true
  belongs_to :deferred_income_account, optional: true
end
