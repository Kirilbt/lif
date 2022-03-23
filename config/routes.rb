Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :spaces, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spaces, only: [:index] do
    resources :bookings, only: [ :new, :create ]
  end
end
