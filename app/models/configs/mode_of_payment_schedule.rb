module Configs
  class ModeOfPaymentSchedule < ApplicationRecord
    belongs_to :mode_of_payment
    def self.current
      order(created_at: :desc).first
    end
  end
end
