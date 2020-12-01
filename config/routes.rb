Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boat_journeys, only: [ :index ]

  resources :users, only: [ :show, :edit, :update ]

  resources :campsites, only: [ :index, :show ]
  resources :campsite_reservations, only: [:new, :create]

end
