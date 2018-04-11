module Taxpayers
  class AccountSignUp
    include ActiveModel::Model
    attr_accessor :first_name, :middle_name, :last_name, :email, :password, :password_confirmation
    def save
      ActiveRecord::Base.transaction do
        create_sign_up
      end
    end
    def find_taxpayer
      Taxpayer.find_by(email: email)
    end

    private
    def create_sign_up
      Taxpayer.create!(
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password_confirmation
        )
    end
  end
end
