# frozen_string_literal: true
require 'sidekiq/web'
Rails.application.routes.draw do
  resources :tickets, except: %i[edit new]
  resources :users, except: %i[edit new]

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
