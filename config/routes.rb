Rails.application.routes.draw do
  root to: 'citizen_focused#index'
  resources :citizen_focused, only: [:index]
  resources :sign_ups, only: [:new, :create], module: :taxpayers
  resources :taxpayers, only: [:show] do
    resources :business_registrations, only: [:new, :create], module: :taxpayers
  end
  resources :businesses do
    resources :pay_by_pay_maya do
      match "/checkout" => "payments/pay_by_pay_maya#checkout",  via: [:post], on: :member
    end
    resources :gross_sales, only: [:new, :create], module: :businesses
    resources :business_activities, only: [:new, :create], module: :businesses
    resources :permit_applications, only: [:new, :create], module: :businesses
  end
  namespace :api do
    namespace :v1 do
      resources :business_registrations, only: [:new, :create]
    end
  end
  resources :app_configurations, only: [:index]
  namespace :app_configurations do
    resources :charges, only: [:new, :create]
    resources :documentary_requirements, only: [:new, :create]
    resources :offices, only: [:new, :create]
    resources :mode_of_payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
