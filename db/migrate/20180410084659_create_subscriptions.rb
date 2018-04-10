class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :subscriber, polymorphic: true
      t.belongs_to :plan, foreign_key: true

      t.timestamps
    end
  end
end
