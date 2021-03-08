Rails.application.routes.draw do
  get 'tickets/index'
  get 'tickets/show'
  get 'tickets/create'
  get 'tickets/update'
  get 'tickets/delete'
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
