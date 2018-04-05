class TaxpayersController < ApplicationController
  def show
    @taxpayer = Taxpayer.find(params[:id])
  end
end
