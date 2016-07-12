Rails.application.routes.draw do
  root 'landing#index'

  resources :users, only: [:show], param: :username
  resources :topics, only: [:index, :show], param: :display_name
  resources :countries, only: [:index, :show], param: :name
  resources :indicators, only: [:index, :show], param: :name
  resources :previews, only: [:index, :show], param: :name

  namespace :admin do
    resources :users, param: :username
    resources :topics, param: :display_name
    resources :tags, only: [:new, :create, :index, :destroy]
    resources :countries, param: :name
    resources :indicators, param: :name
    resources :previews, param: :name
    get '/dashboard', to: 'dashboard#index'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
end
