require 'dotenv'
require 'json'
Dotenv.load


class HomeController < ApplicationController
  def home
    santiago_lat=-33.4569
    santiago_lon=-70.6483
    @jugadores = Jugador.all.order("created_at ASC")
    @bets = Bet.select('*, bets.id').joins(:jugador).where("round_id = #{Round.last.id}")
    @seven_days_weather = WeatherService.new(santiago_lat,santiago_lon).get_weather()
    @previous_rounds_winners = Round.last(9)
    # sleep(3.minutes)
    # redirect_to playersbets_path
  end

  def makebets
    round = Round.new
    round.play_new_round
    redirect_to root_path
  end

  def selectwinner
    round = Round.new
    round.select_winner
    redirect_to root_path
  end

  def paybets
    round = Round.new
    round.pay_bets
    redirect_to root_path
  end

end