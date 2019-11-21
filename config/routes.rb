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
      resources :tournaments, only: [:create, :index, :show, :update, :destroy]
      resources :teams, only: [:create, :index, :show, :update]
      resources :entries, only: [:create, :destroy, :update]
      resources :memberships, only: [:create]
      delete '/memberships/:team_id', to: 'memberships#delete_by_team'
      resources :admins, only: [:create, :destroy]
      resources :brackets, only: [:create, :index]
      resources :nodes, only: [:index]
      resources :team_requests, only: [:create]
    end
  end
end
