class Business < ApplicationRecord
  has_many :business_owners
  has_many :taxpayer_owners, through: :business_owners, source: :owner, source_type: "Taxpayer"
end
