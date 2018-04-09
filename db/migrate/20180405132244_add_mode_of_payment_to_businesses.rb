class AddModeOfPaymentToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :mode_of_payment, foreign_key: true
  end
end
