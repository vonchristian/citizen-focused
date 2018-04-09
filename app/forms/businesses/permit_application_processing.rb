module Businesses
  class PermitApplicationProcessing
    include ActiveModel::Model

    def file_application
      find_mayors_permit.applications.create(applicant: find_business, date: date)
    end
  end
end
