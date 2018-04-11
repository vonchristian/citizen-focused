class SubscribersController < ApplicationController
  def show
    @subscriber = Subscriber.find(params[:id])
  end
end
