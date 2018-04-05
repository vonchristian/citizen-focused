class AccountSignUp
  include ActiveModel::Model
  attr_accessor :first_name, :middle_name, :last_name
  def save
    ActiveRecord::Base.transaction do
      create_sign_up
    end
  end

  private
  def create_sign_up
    Taxpayer.create(
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name)
  end
end
