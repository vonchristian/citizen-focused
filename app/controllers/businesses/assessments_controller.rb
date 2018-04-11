module Businesses
  class AssessmentsController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @assessment = Businesses::Assessment.new
    end
    def create
      @business = Business.find(params[:business_id])
      @assessment = Businesses::Assessment.new(assessment_params)
      if @assessment.valid?
        @assessment.save
        redirect_to "/", notice: "successfully"
      else
        render :new
      end
    end
    def show
      @business = Business.find(params[:business_id])
      @assessment = Accounting::Entry.find(params[:id])
    end

    private
    def assessment_params
      params.require(:businesses_assessment).
      permit(:date, :business_id)
    end
  end
end
