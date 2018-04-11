Rails.application.routes.draw do
  devise_for :users
  devise_for :taxpayers, { registrations: "taxpayer_account_sign_ups" }
  root to: 'citizen_focused#index'
  namespace :citizen_focused do
    resources :subscriptions, only: [:new, :create]
    resources :for_governments, only: [:index]
    resources :for_taxpayers, only: [:index]

  end
  resources :citizen_focused, only: [:index]
  resources :taxpayer_account_sign_ups, only: [:new, :create], module: :taxpayers
  resources :taxpayers, only: [:show] do
    resources :confirmations, only: [:new, :create], module: :taxpayers
    resources :business_registrations, only: [:new, :create], module: :taxpayers
  end
  resources :businesses do
      resources :over_the_counter_payments, only: [:new, :create], module: [:businesses, :payment_channels]
    resources :pay_by_pay_maya do
      match "/checkout" => "payments/pay_by_pay_maya#checkout",  via: [:post], on: :member
    end
    resources :additional_charges,  only: [:new, :create], module: :businesses
    resources :assessments,         only: [:new, :create, :show], module: :businesses
    resources :gross_sales,         only: [:new, :create], module: :businesses
    resources :business_activities, only: [:new, :create], module: :businesses
    resources :permit_applications, only: [:new, :create], module: :businesses
  end

  namespace :api do
    namespace :v1 do
      resources :business_registrations, only: [:new, :create]
    end
  end

  resources :subscribers, only: [:show] do
    namespace :configurations do
      resources :charges, only: [:new, :create]
      resources :documentary_requirements, only: [:new, :create]
      resources :offices, only: [:new, :create]
      resources :mode_of_payments, only: [:new, :create]
    end
    resources :properties, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
