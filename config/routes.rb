Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'search/:query', to: 'search#index'
    end
  end

  
  # get '/events', to: "events#get_events"
  post "/graphql", to: "graphql#execute"

  resources :events

  resources :users



  # resources :users do
  #   resourses :user_events, only: [:create]
  # end

  resources :user_events


  resources :sessions

  resources :user_events, only: [:index, :create, :update, :delete, :show]



  get "/me", to: 'sessions#autologin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
