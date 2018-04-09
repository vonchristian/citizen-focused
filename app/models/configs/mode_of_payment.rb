module Configs
  class ModeOfPayment < ApplicationRecord
    has_many :schedules, class_name: "Configs::ModeOfPaymentSchedule"
    validates :name, presence: true
  end
end
