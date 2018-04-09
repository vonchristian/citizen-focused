class DocumentaryRequirementCharge < ApplicationRecord
  belongs_to :charge
  belongs_to :documentary_requirement

  validates :charge_id, uniqueness: { scope: :documentary_requirement_id }
end
