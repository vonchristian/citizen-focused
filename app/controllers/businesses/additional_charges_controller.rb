module Businesses
  class AdditionalChargesController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @charge = @business.business_charges.build
    end
    def create
       @business = Business.find(params[:business_id])
      @charge = @business.business_charges.create(charge_params)
      @charge.save
      redirect_to new_business_additional_charge_path(@business), notice: "Added successfully"
    end

    private
    def charge_params
      params.require(:chargeable).permit(:charge_id)
    end
  end
end
