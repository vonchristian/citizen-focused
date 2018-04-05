Rails.application.routes.draw do
  root to: 'citizen_focused#index'
  resources :citizen_focused, only: [:index]
  resources :sign_ups, only: [:new, :create], module: :taxpayers
  resources :taxpayers, only: [:show] do
    resources :business_registrations, only: [:new, :create], module: :taxpayers
  end
  resources :businesses do
    resources :pay_by_pay_maya, only: [:new, :create], module: :payments
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
