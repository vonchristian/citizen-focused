class Taxpayer < ApplicationRecord
  has_many :business_owners, as: :owner, class_name: "Businesses::BusinessOwner"
  has_many :businesses, through: :business_owners
end
