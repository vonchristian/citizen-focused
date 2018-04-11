class RedeemedPromotion < ApplicationRecord
  belongs_to :redeemer, polymorphic: true
  belongs_to :promotion
end
