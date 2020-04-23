Rails.application.routes.draw do
  resources :join_listings
  resources :host_listings
  require 'sidekiq/web'
  root 'host_listings#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
