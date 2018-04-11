class Subscription < ApplicationRecord
  belongs_to :subscriber, class_name: "CityOrMunicipality", foreign_key: 'subscriber_id'
  belongs_to :plan
end
