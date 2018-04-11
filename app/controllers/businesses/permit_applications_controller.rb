module Businesses
  class PermitApplicationsController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @permit_application = Businesses::PermitApplicationProcessing.new
    end
    def create
      @business = Business.find(params[:business_id])
      @permit_application = Businesses::PermitApplicationProcessing.new(permit_application_params)
      if @permit_application.valid?
        @permit_application.file_application!
        redirect_to "/", notice: "Application filed successfully"
      else
        render :new
      end
    end

    private
    def permit_application_params
      params.require(:businesses_permit_application_processing).
      permit(:application_date, :business_id)
    end
  end
end
