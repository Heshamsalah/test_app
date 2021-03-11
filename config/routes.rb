# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  resources :users, except: %i[edit new] do
    resources :tickets, except: %i[edit new] do
      resources :reminders, except: %i[edit new]
    end
  end

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
