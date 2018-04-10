class AddSubscriberToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :subscriber, foreign_key: true
  end
end
