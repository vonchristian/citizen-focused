class RemoveSubscriberFromSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :subscriptions, :subscriber, polymorphic: true
  end
end
