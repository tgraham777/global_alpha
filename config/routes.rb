Rails.application.routes.draw do
  root 'landing#index'

  resources :users, only: [:new, :create, :show]
  resources :topics, only: [:new, :create, :index, :show]
  resources :tags, only: [:create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
end
