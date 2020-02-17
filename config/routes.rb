Rails.application.routes.draw do
  resources :event
  resources :user
  resources :session

  root to: 'event#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
