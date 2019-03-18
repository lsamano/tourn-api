Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      resources :tournaments, only: [:create, :index, :show]

      resources :teams, only: [:create, :index, :show]
    end
  end
end
