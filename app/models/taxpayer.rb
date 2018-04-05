class Taxpayer < ApplicationRecord
  has_many :business_owners, as: :owner
  has_many :businesses, through: :business_owners
end
