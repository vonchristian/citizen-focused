class Chargeable < ApplicationRecord
  belongs_to :charged, polymorphic: true
  belongs_to :charge
  delegate :name, :amount, to: :charge
  delegate :no_of_payments_per_year, to: :charged

  def self.can_be_deferred
    where(can_be_deferred: true)
  end

  def self.total
    sum(&:amount)
  end

  def self.paid?(options={})
    all.map{ |a| a.paid?(options) }
  end
  def paid?(options={})
    revenue_account.where(commercial_document: self).present?
  end
  def payable_amount(options={})
    if can_be_deferred?
      amount / no_of_payments_per_year
    end
  end
  def deferred_amount
    amount - payable_amount
  end

end
