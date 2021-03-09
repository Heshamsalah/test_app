# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tickets, except: %i[edit new]
  resources :users, except: %i[edit new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
