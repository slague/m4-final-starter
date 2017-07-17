Rails.application.routes.draw do
  root to: "links#index"

  get '/home', to: 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index, :new, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
