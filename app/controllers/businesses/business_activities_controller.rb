module Businesses
  class BusinessActivitiesController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @business_activity = Businesses::BusinessActivityProcessing.new
    end

    def create
      @business = Business.find(params[:business_id])
      @business_activity = Businesses::BusinessActivityProcessing.new(business_activity_params)
      @business_activity.process!
      redirect_to new_business_business_activity_url(@business), notice: "Added successfully."
    end

    private
    def business_activity_params
      params.require(:businesses_business_activity_processing).
      permit(:activity_id, :business_id, :quantity)
    end
  end
end
