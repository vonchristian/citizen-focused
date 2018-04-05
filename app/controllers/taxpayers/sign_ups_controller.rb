module Taxpayers
  class SignUpsController < ApplicationController
    def new
      @sign_up = AccountSignUp.new
    end
    def create
      @sign_up = AccountSignUp.new(sign_up_params)
      if @sign_up.valid?
        @sign_up.save
        redirect_to "/", notice: "successfully"
      else
        render :new
      end
    end

    private
    def sign_up_params
      params.require(:account_sign_up).
      permit(:first_name, :middle_name, :last_name)
    end
  end
end

