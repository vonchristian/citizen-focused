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
        redirect_to new_business_business_activity_url(@business_registration.find_business), notice: "Business registration saved successfully."
      else
        render :new
      end
    end

    private
    def business_params
      params.require(:taxpayers_business_registration).
      permit(:name, :taxpayer_id, :mode_of_payment_id,
        :building_number, :street, :barangay, :city_or_municipality, :province)
    end
  end
end
