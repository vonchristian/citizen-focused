class DocumentaryRequirement < ApplicationRecord
  belongs_to :office
  has_many :documentary_requirement_charges
  has_many :transactions,             class_name: "DocumentaryRequirements::Transaction"
  has_many :application_transactions, class_name: "DocumentaryRequirements::Transactions::Application"
  has_many :approval_transactions, class_name: "DocumentaryRequirements::Transactions::Approval"

  has_many :applicants, through: :transactions
  def application_status_for(applicant)
    if application_transactions.where(applicant: applicant).present?
      "Applied"
    end
  end
  def approval_status_for(applicant)
    if approval_transactions.where(applicant: applicant).present?
      "Approved"
    end
  end
end
