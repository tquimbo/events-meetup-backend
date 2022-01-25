Rails.application.routes.draw do
  resources :users
  resources :events, only: [:index, :show]
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
