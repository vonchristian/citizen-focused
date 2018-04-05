module Taxpayers
  class BusinessRegistrationsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business_registration = Taxpayers::BusinessRegistration.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business_registration = Taxpayers::BusinessRegistration.new(business_params)
      if @business_registration.valid?
        @business_registration.register!
        redirect_to taxpayer_url(@taxpayer), notice: "Business registration saved successfully."
      else
        render :new
      end
    end

    private
    def business_params
      params.require(:taxpayers_business_registration).
      permit(:name, :taxpayer_id)
    end
  end
end
