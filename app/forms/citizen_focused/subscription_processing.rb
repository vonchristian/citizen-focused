module CitizenFocused
  class SubscriptionProcessing
    include ActiveModel::Model
    attr_accessor :email, :name, :plan_id
    validates :email, presence: true
    def subscribe!
      create_subscription
    end
    private
    def create_subscription
      subscriber = Subscriber.create(name: name)
      Subscription.create(
        subscriber: subscriber,
        plan: find_plan)
    end
    def find_plan
      Plan.find_by_id(plan_id)
    end
  end
end
