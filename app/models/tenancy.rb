class Tenancy < ApplicationRecord
  belongs_to :tenant, polymorphic: true
  belongs_to :property
end
