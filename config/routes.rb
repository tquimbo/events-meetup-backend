Rails.application.routes.draw do
  resources :users
  resources :events
  resources :sessions
  get "/me", to: 'sessions#autologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
