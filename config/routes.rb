Rails.application.routes.draw do
  resources :notifications
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'host_listings#index'

  resources :items
  resources :users
  resources :join_listings
  resources :host_listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
