Rails.application.routes.draw do
  get 'jugador/create'
  post 'jugador/store'
  resources :jugador, only: [:destroy, :update]
  root 'home#index'
end
