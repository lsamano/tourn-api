Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      resources :users, only: [:create, :index, :show, :update]
      resources :tournaments, only: [:create, :index, :show, :update]
      resources :teams, only: [:create, :index, :show, :update]
    end
  end
end
