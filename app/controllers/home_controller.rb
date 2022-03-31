class HomeController < ApplicationController
  def index
    @jugadores = Jugador.all.order("created_at DESC")
  end
end
