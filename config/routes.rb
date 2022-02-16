Rails.application.routes.draw do
  get '/events', to: "events#get_events"
  post "/graphql", to: "graphql#execute"
  resources :users
  resources :events
  resources :sessions
  # get "/me", to: 'sessions#autologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
