Rails.application.routes.draw do
  get '/sandwiches/most_expensive', to: 'sandwiches#most_expensive'

  get 'auth/github', as: "github_login"
  get '/auth/:provider/callback', to: "sessions#update"

  resources :sandwiches
  resources :orders
  resources :categories
  
  resources :orders do 
    resources :sandwiches, only: [:new, :create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
