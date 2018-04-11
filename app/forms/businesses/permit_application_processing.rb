module Businesses
  class PermitApplicationProcessing
    include ActiveModel::Model
    attr_accessor :application_date, :business_id

    def file_application!
      find_business.business_requirements.each do |requirement|
        file_application(requirement.documentary_requirement)
      end
    end
    def file_application(documentary_requirement)
      documentary_requirement.application_transactions.create(applicant: find_business, application_date: application_date)
    end
    def find_business
      Business.find_by_id(business_id)
    end
  end
end
