Rails.application.routes.draw do
  # get 'jugador/create'
  # post 'jugador/store'
  resources :jugador
  # resources :bet
  root 'home#home'
  get 'previousrounds', to: 'home#previousrounds'
  get 'playround', to: 'home#playround'
end
