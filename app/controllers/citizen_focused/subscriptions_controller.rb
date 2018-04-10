module CitizenFocused
  class SubscriptionsController < ApplicationController
    def new
      @subscription = CitizenFocused::SubscriptionProcessing.new
    end
    def create
      @subscription = CitizenFocused::SubscriptionProcessing.new(subscription_params)
      if @subscription.valid?
        @subscription.subscribe!
        redirect_to "/", notice: "Subscription"
      else
        render :new
      end
    end

    private
    def subscription_params
      params.require(:citizen_focused_subscription_processing).
      permit(:email, :name, :plan_id)
    end
  end
end
