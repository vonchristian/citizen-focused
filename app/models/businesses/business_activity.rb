module Businesses
  class BusinessActivity < ApplicationRecord
    belongs_to :activity
    belongs_to :business
  end
end
