module Businesses
  class GrossSaleCharge < ApplicationRecord
    belongs_to :charge
    belongs_to :gross_sale
  end
end
