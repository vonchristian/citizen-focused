class AddApprovedAtToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :approved_at, :datetime
    add_column :transactions, :revoked_at, :datetime
    add_column :transactions, :verified_at, :datetime
    add_column :transactions, :application_date, :datetime
  end
end
