Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :boat_journeys, only: [ :index ]

  resources :users, only: [ :show, :edit, :update ] do
    resources :boats, only: [ :edit, :update ]
  end
  
  resources :boats, only: [ :new, :create ]

  resources :campsites, only: [ :index, :show ]
end
