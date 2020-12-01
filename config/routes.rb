Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [ :show, :edit, :update ] do
    resources :campsite_reservations, only: :index
  end

  resources :campsites, only: [ :index, :show ] do
    resources :campsite_reservations, only: [:new, :create]
  end

  resources :campsite_reservations, only: [:edit, :update, :destroy]

  resources :boat_journeys, only: [ :index ]

  # routes for local users
  namespace :local do
    resources :boats, only: [ :new, :create, :edit, :update, :index, :destroy ]
  end
end
