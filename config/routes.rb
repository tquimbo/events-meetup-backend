Rails.application.routes.draw do

  
  # get '/events', to: "events#get_events"
  post "/graphql", to: "graphql#execute"

  resources :events do
    resources :users
  end

  resources :users do
    resources :events
  end

  resources :sessions
  resources :user_events



  get '/events/user/:id', to: 'events#users'
  get "/me", to: 'sessions#autologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
