Rails.application.routes.draw do
  resources :join_listings
  resources :host_listings
  require 'sidekiq/web'
  root 'listings#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :queue_list_to_users
  resources :queue_lists
  resources :items
  resources :listings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
