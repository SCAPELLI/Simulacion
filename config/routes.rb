Rails.application.routes.draw do
  root "sessions#login"

  get "/movies/seeker", to: "movies#seeker"

  get "/movies/seeker/result", to: "movies#results"
  post "/movies/seeker/result", to: "movies#results"

  get "/movies/id/:id", to: "movies#find_by_id"

  #Users routes:
  resources :users, only: [:new, :create]

  #Sessions routes:
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

end
