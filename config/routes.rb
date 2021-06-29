Rails.application.routes.draw do
  root "sessions#login"
  get "/movies", to: "movies#index"

  get "/movies/seeker", to: "movies#seeker"
  post "/movies/seeker/result", to: "movies#result"

  #Users routes:
  resources :users, only: [:new, :create]

  #Sessions routes:
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

end
