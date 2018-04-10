class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions
  validates :name, presence: true, uniqueness: true

end
