Rails.application.routes.draw do
  # get 'jugador/create'
  # post 'jugador/store'
  resources :jugador
  resources :bet
  root 'home#home'
  get 'previousrounds', to: 'home#previousrounds'
  get 'playersbets', to: 'home#makebets'
  get 'paybets', to: 'home#paybets'
end
