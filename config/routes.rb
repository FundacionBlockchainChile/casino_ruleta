Rails.application.routes.draw do
  # get 'jugador/create'
  # post 'jugador/store'
  resources :jugador
  root 'home#home'
end
