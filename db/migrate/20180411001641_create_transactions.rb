class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :applicant, polymorphic: true
      t.belongs_to :documentary_requirement, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
