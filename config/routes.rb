Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/sandwiches/most_expensive', to: 'sandwiches#most_expensive'

  resources :users

  resources :orders, only: [:new, :create, :index]

  resources :sandwiches do
    resources :orders, shallow: true
  end
  resources :categories

  root to: 'sessions#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
