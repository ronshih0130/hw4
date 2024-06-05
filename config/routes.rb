Rails.application.routes.draw do
  root "places#index"

  resources :places
  resources :entries
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
