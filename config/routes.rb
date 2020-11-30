Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # route for campsite_reservations
  resources :camspites, only: [:index, :show] do
    resources :campsite_reservations, only: [:new, :create]
  end
end
