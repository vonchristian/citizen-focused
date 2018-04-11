module Businesses
  module PaymentChannels
    class OverTheCounterPaymentsController < ApplicationController
      def new
        @assessment = Accounting::Entry.find(params[:entry_id])
        @business = Business.find(params[:business_id])
        @payment = Businesses::PaymentChannels::OverTheCounterPaymentProcessing.new
      end
      def create
        @business = Business.find(params[:business_id])
        @payment = Businesses::PaymentChannels::OverTheCounterPaymentProcessing.new(payment_params)
        if @payment.valid?
          @payment.save
          redirect_to '/', notice: "Payment accepted successfully"
        else
          render :new
        end
      end

      private
      def payment_params
        params.require(:businesses_payment_channels_over_the_counter_payment_processing).
        permit(:date)
      end
    end
  end
end
