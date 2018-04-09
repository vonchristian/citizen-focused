class DocumentaryRequirement < ApplicationRecord
  belongs_to :office
  has_many :documentary_requirement_charges
  has_many :transactions
  has_many :applicants, through: :transactions
end
