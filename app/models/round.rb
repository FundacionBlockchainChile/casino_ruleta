class Round < ApplicationRecord
  has_many  :bets, dependent: :destroy
  belongs_to :roullette

  def get_random_value(min,max)
    return rand(min..max)
  end

  # metohod inicial_bets 
    # selleciona cada jugador y realiza una apuesta
  def make_all_players_inicial_bets
    players = Jugador.all
    for player in players
      player.make_bet
    end
  end

  # selecciona color ganador select_winner_color
  def get_round_color_winner
    value = get_random_value(1,100)
    if value > 0 && value < 3
      return 'green'
    elsif value >= 3 && value < 52
      return 'red'
    else
      return 'black'
    end
  end

  def make_new_round
    Round.create(roullette_id: Roullette.last.id)
  end

  # JUGAR RONDA
  def play_new_round
    # crear nueva ronda
    self.make_new_round
    # Hacer apuestas iniciales
    self.make_all_players_inicial_bets
    # Seleccionar ganador
    self.select_winner
  end

  # Seleccionar color ganador
  def select_winner
    winner_color = self.get_round_color_winner
    Round.last.update(winner_color: winner_color)
  end

  def pay_bets
    bets = Bet.where("round_id = #{Round.last.id}")
    color_winner = Round.last.winner_color

    for bet in bets
      jugador = Jugador.find(bet.jugador_id)

      if bet.bet_color == color_winner && winner_color == 'green'
        jugador.total_billetera = jugador.total_billetera + (bet.bet_ammount * 15)
      elsif bet.bet_color == color_winner
        jugador.total_billetera = jugador.total_billetera + (bet.bet_ammount * 2)
      else
        jugador.total_billetera = jugador.total_billetera - bet.bet_ammount
      end

      jugador.save
    end      
  end   

end
