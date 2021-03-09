Rails.application.routes.draw do
  resources :tickets, except: [:edit, :new]
  resources :users, except: [:edit, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
