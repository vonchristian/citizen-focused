class Business < ApplicationRecord
  belongs_to :supporter,         class_name: "Subscriber",
                                 foreign_key: 'supporter_id'
  belongs_to :mode_of_payment,   class_name: "Configs::ModeOfPayment"
  has_many :business_owners,     class_name: "Businesses::BusinessOwner"
  has_many :taxpayer_owners,     through: :business_owners,
                                 source: :owner,
                                 source_type: "Taxpayer"
  has_many :business_charges,    class_name: "Chargeable",
                                 as: :charged
  has_many :charges,             through: :business_charges
  has_many :gross_sales,         class_name: "Businesses::GrossSale"
  has_many :business_activities, class_name: "Businesses::BusinessActivity"

  delegate :name, to: :mode_of_payment, prefix: true
  delegate :no_of_payments_per_year, to: :mode_of_payment

end
