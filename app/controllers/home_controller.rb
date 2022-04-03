require 'dotenv'
require 'json'
Dotenv.load


class HomeController < ApplicationController
  def home
    # jugador = Jugador.new
    # jugador.total_billetera = 10000
    # byebug
    santiago_lat=-33.4569
    santiago_lon=-70.6483
    @jugadores = Jugador.all.order("created_at ASC")
    @bets = Bet.select('*, bets.id').joins(:jugador).order("created_at DESC")
    @seven_days_weather = WeatherService.new(santiago_lat,santiago_lon).get_weather()
  end

end