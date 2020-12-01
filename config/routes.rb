Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [ :show, :edit, :update ]

  resources :campsites, only: [ :index, :show ]
  
  resources :boat_journeys, only: [ :index ]

  # routes for local users
  namespace :local do
    resources :boats, only: [ :new, :create, :edit, :update, :index, :destroy ] do
      resources :boat_journeys, only: [ :new, :create ]
    end
    resources :boat_journeys, only: [ :index, :edit, :update, :destroy ]
  end
end
