class Taxpayer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :business_owners, as: :owner, class_name: "Businesses::BusinessOwner"
  has_many :businesses, through: :business_owners
end
