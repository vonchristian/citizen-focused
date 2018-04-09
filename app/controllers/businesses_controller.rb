class BusinessesController < ApplicationController
  def show
    @business = Business.find(params[:id])
    @business_charges = @business.business_charges
  end
end
