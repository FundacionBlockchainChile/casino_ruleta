Rails.application.routes.draw do
  # get 'jugador/create'
  # post 'jugador/store'
  resources :jugador
  resources :bet
  root 'home#home'
end
