Rails.application.routes.draw do
  get '/sandwiches/most_expensive', to: 'sandwiches#most_expensive'

  get 'auth/github', as: "github_login"
  get '/auth/:provider/callback', to: "sessions#update"
  # get '/sandwiches', to: 'sandwiches#index'
  # get '/sandwiches/:id', to: 'sandwiches#show', as: 'sandwich'
  resources :sandwiches

  resources :categories do
    resources :sandwiches
  end
  
  resources :orders do 
    resources :sandwiches
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
