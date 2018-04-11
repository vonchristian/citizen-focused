module Taxpayers
  class ConfirmationsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
    end
  end
end
