class HomeController < ApplicationController
  def home
    @jugadores = Jugador.all.order("created_at DESC")
  end
end
