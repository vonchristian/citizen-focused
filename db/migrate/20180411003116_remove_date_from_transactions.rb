class RemoveDateFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :date, :datetime
  end
end
