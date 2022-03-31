Rails.application.routes.draw do
  get 'jugador/create'
  post 'jugador/store'
  root 'home#index'

  # root "application#index"
end
