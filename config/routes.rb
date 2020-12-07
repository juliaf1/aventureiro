Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [ :show, :edit, :update ] do
    resources :campsite_reservations, only: :index
  end

  resources :campsites, only: [ :index, :show ] do
    resources :campsite_reservations, only: [ :new, :create ]
  end

  resources :campsite_reservations, only: [ :edit, :update, :destroy ]

  resources :boat_journeys, only: [ :index ] do
    resources :boat_journey_reservations, only: [ :new, :create ]
  end

  resources :boat_journey_reservations, only: [ :index, :destroy ]

  resources :boats, only: [ :index ]

  # routes for local users
  namespace :local do
    resources :boats, only: [ :new, :create, :edit, :update, :index, :destroy ] do
      resources :boat_journeys, only: [ :new, :create ]
    end
    resources :boat_journeys, only: [ :index, :edit, :update, :destroy ]
    resources :campsites, only: [ :edit, :update, :index ] do
      resources :full_periods, only: [ :new, :create ]
    end
    resources :boat_journey_reservations, only: [ :index, :update, :show ]
    resources :campsite_reservations, only: [ :index, :update, :show ]
    resources :full_periods, only: [ :destroy ]
  end

  # API routes for whatsapp integration
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :campsite_reservations, only: [ :index ]
      resources :boat_journey_reservations, only: [ :index ]
    end
  end
end
