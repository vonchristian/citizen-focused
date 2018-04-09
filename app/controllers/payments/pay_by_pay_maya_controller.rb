require 'paymaya'
module Payments
  class PayByPayMayaController < ApplicationController
    def checkout
      @business = Business.find(params[:business_id])
      valid_checkout = {
        total_amount: {
        currency: 'PHP',
        value: '1234.56'
      },
  buyer: {
    first_name: 'Grayson',
    middle_name: 'Eichmann',
    last_name: 'Howe',
    contact: {
      phone: '(477) 575-5820',
      email: 'grayson_howe@gleichner.com'
    },
    },
  items: [
    {
      name: 'Business Tax',
      quantity: '3',
      amount: {
        value: '1621.10',
        details: {
          discount: '100.00',
          subtotal: '1721.10'
        }
      },
      total_amount: {
        value: '4863.30',
        details: {
          discount: '300.00',
          subtotal: '5163.30'}
        }
      }
  ],
  request_reference_number: '000141386713',
  metadata: {},
  redirect_url: {
    success: "http://localhost:3000/businesses/#{@business.id}",
    failure: 'http://www.askthemaya.com/failure?id=6319921',
    cancel: 'http://www.askthemaya.com/cancel?id=6319921'
  }
}
  redirect_to Paymaya::Checkout::Checkout.create(valid_checkout)[:redirect_url]
    end
  end
end
