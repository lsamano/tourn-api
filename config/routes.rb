Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      resources :tournaments, only: [:create, :index]

      resources :teams, only: [:create, :index]
    end
  end
end
