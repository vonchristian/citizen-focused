require 'paymaya'
module PaymentChannels
  class PayMaya
    include ActiveModel::Model
    attr_accessor :business_id
    def process
      ActiveRecord::Base.transaction do
        process_pay_maya_payment
      end
    end

    private
    def process_pay_maya_payment
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
    shipping_address: {
      line1: '9F Robinsons Cybergate 3',
      line2: 'Pioneer Street',
      city: 'Mandaluyong City',
      state: 'Metro Manila',
      zip_code: '12345',
      country_code: 'PH'
    },
    billing_address: {
      line1: '9F Robinsons Cybergate 3',
      line2: 'Pioneer Street',
      city: 'Mandaluyong City',
      state: 'Metro Manila',
      zip_code: '12345',
      country_code: 'PH'
    },
    ip_address: '129.180.98.95'
  },
  redirect_url: {
    success: 'http://localhost:3000/',
    failure: 'http://localhost:3000/failure?id=6319921',
    cancel: 'http://localhost:3000/cancel?id=6319921'
  },
  items: [
    {
      name: 'Heavy Duty Plastic Bag',
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
  metadata: {}
}
  Paymaya::Checkout::Checkout.create valid_checkout
    end
    def post_payment
      Accounting::Entry.create(
        description: "Payment through PayMaya Checkout"
        debit_amounts_attributes: [
          amount: amount,
          account: paymaya_account,
          commercial_document: charge,
        ])
    end

  end
end
