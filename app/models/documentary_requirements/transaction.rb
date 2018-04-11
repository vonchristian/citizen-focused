module DocumentaryRequirements
  class Transaction < ApplicationRecord
    belongs_to :applicant, polymorphic: true
    belongs_to :documentary_requirement
  end
end
