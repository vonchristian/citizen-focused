class Subscriber < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :businesses, foreign_key: 'supporter_id'
  has_many :subscriptions
  has_many :subscribed_plans, through: :subscriptions, source: :plan

end
