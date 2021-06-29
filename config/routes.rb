Rails.application.routes.draw do
  root "sessions#login"
  get "/movies", to: "movies#index"

  get "/movies/filters", to: "movies#filters"
  post "/movies/seeker", to: "movies#seeker"

  get "/movies/seeker", to: "movies#seeker"

  #Users routes:
  resources :users, only: [:new, :create]

  #Sessions routes:
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

end
