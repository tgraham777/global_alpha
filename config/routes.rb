Rails.application.routes.draw do
  root 'landing#index'

  resources :users, only: [:show], param: :display_name
  resources :topics, only: [:index, :show], param: :display_name
  resources :countries, only: [:index, :show], param: :display_name
  resources :indicators, only: [:index, :show], param: :display_name
  resources :previews, only: [:index, :show], param: :display_name

  namespace :admin do
    resources :users, param: :display_name
    resources :topics, param: :display_name
    resources :tags, only: [:new, :create, :index, :destroy]
    resources :countries, param: :display_name
    resources :indicators, param: :display_name
    resources :previews, param: :display_name
    get '/dashboard', to: 'dashboard#index'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'
end
