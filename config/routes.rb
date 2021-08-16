Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  delete '/logout', to: 'sessions#destroy'
  
  get '/sandwiches/most_expensive', to: 'sandwiches#most_expensive'

  resources :users

  resources :sandwiches do
    resources :orders, only: [:new, :create, :show]
  end
  resources :orders
  resources :categories

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
