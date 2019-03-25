Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'brackets/create'
    end
  end
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      resources :users, only: [:create, :index, :show, :update]
      resources :tournaments, only: [:create, :index, :show, :update]
      resources :teams, only: [:create, :index, :show, :update]
      resources :entries, only: [:create, :destroy, :update]
      resources :memberships, only: [:create, :destroy]
      resources :admins, only: [:create, :destroy]
      resources :brackets, only: [:create, :index]
      resources :nodes, only: [:index]
    end
  end
end
