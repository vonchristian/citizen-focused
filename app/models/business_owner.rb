class BusinessOwner < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :business

  validates :owner_id, uniqueness: { scope: :business_id }
end
