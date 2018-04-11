class Activity < ApplicationRecord
  has_one :activity_charge
  delegate :charge, to: :activity_charge
end
