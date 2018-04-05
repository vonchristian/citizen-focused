module Payments
  class PayByPayMayaController < ApplicationController
    def new
      @payment = Payments::PayByPayMaya.new
    end
  end
end
