module Taxpayers
  class TaxpayerAccountSignUpsController < ApplicationController
    def new
      @sign_up = Taxpayers::AccountSignUp.new
    end
    def create
      @sign_up = Taxpayers::AccountSignUp.new(sign_up_params)
      if @sign_up.valid?
        @sign_up.save
        redirect_to citizen_focused_for_taxpayers_url, notice: "successfully"
      else
        render :new
      end
    end

    private
    def sign_up_params
      params.require(:taxpayers_account_sign_up).
      permit(:first_name, :middle_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end

