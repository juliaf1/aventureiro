Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :users, only: [ :edit, :update ]

  # routes for campsite index and show pages
  resources :campsites, only: [:index, :show]
end
