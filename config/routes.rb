Rails.application.routes.draw do
  get '/sandwiches/most_expensive', to: 'sandwiches#most_expensive'

  # get '/sandwiches', to: 'sandwiches#index'
  # get '/sandwiches/:id', to: 'sandwiches#show', as: 'sandwich'
  resources :sandwiches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
