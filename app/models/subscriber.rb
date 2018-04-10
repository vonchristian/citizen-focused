class Subscriber < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :businesses, foreign_key: 'supporter_id'

end
