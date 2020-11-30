Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :boat_journey, only: [ :index ]
  
  resources :users, only: [ :edit, :update ]

  resources :campsites, only: [ :index, :show ]
end
