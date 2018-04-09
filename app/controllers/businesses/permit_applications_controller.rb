module Businesses
  class PermitApplicationsController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @business_charges = @business.business_charges
    end
  end
end
