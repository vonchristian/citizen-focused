class ActivityCharge < ApplicationRecord
  belongs_to :activity
  belongs_to :charge
end
