class AddDeferredIncomeAccountToCharges < ActiveRecord::Migration[5.2]
  def change
    add_reference :charges, :deferred_income_account, foreign_key: { to_table: :accounting_accounts }
    add_reference :charges, :penalty_account, foreign_key: { to_table: :accounting_accounts }
  end
end
