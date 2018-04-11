module Businesses
  class BusinessRequirement < ApplicationRecord
    belongs_to :business
    belongs_to :documentary_requirement
    delegate :name, to: :documentary_requirement
    def application_status
      documentary_requirement.application_status_for(business)
    end
    def approval_status
      documentary_requirement.approval_status_for(business)
    end
  end
end
