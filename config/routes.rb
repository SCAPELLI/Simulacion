Rails.application.routes.draw do
  root "sessions#login"
  get "/movies", to: "movies#index"


  #Users routes:
  resources :users, only: [:new, :create]

  #Sessions routes:
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

end
