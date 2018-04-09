class CreateModeOfPaymentSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :mode_of_payment_schedules do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :mode_of_payment, foreign_key: true

      t.timestamps
    end
  end
end
