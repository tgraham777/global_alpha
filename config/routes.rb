Rails.application.routes.draw do
  root 'landing#index'

  resources :users, only: [:new, :create, :show], param: :username
  resources :topics, param: :title
  resources :tags, only: [:new, :create, :index, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
end
