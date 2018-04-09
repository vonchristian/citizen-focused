module Businesses
  class GrossSalesController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @gross_sale = Businesses::GrossSaleProcessing.new
    end
    def create
      @business = Business.find(params[:business_id])
      @gross_sale = Businesses::GrossSaleProcessing.new(gross_sale_params)
      if @gross_sale.valid?
        @gross_sale.process!
        redirect_to @business, notice: "Gross Sales saved successfully."
      else
        render :new
      end
    end

    private
    def gross_sale_params
      params.require(:businesses_gross_sale_processing).
      permit(:gross_sale, :start_date, :end_date, :date_entered, :business_id)
    end
  end
end
