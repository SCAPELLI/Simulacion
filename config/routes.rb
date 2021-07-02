Rails.application.routes.draw do
  root "sessions#login"

  get "/movies", to: "tmdb_movies#index"

  get "/movies/seeker", to: "tmdb_movies#seeker"

  get "/movies/seeker/result", to: "tmdb_movies#results"
  post "/movies/seeker/result", to: "tmdb_movies#results"

  get "/movies/id/:id", to: "tmdb_movies#find_by_id"

  #Users routes:
  resources :users, only: [:new, :create] do
    resources :movies
  end
  get "/users/:id", to: "users#show"

  #Sessions routes:
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

end

