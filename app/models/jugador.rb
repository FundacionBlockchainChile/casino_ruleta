class Jugador < ApplicationRecord
  has_many  :bets

  validates :nombre, presence: true, length: { minimum: 4 }
  validates :email, presence: true
  validates :total_billetera, presence: true

  # OBTENER MONTO DE APUESTA

  # Metodo que seleccione valor al azar entre X e Y. get_random_value(min,max)
  def get_random_value(min,max)
    return rand(min..max)
  end
  # Metodo que dado la respuesta de la API, verifique si alguno de los próximos 7 dias hay una temperatura mayor a 27. 
  # is_conservative_bet ➝ boolean
  def is_conservative_bet
    service_weather = WeatherService.new
    seven_days_weather = service_weather.get_weather
    seven_days_weather[0][:max]
    is_conservative = false
    for day in seven_days_weather
      if day[:max] > 27
        is_conservative = true
      end
    end
    return is_conservative
  end
  # Metodo get_bet_amount .
  # verifica si tiene menos que 1000 y más que 0, si tiene menos que 1000, return current_amount .
  def get_bet_ammount
    if self.total_billetera < 1000 && self.total_billetera > 0
      return self.total_billetera
    end
    # Luego, llama a is_conservative_bet .
    is_conservative = self.is_conservative_bet
    # Dependiendo de esto setea los máximos y mínimos
    if is_conservative
      return self.total_billetera * get_random_value(3,7) / 100
    else
      return self.total_billetera *  get_random_value(8,15) / 100
    end
  end

  # OBTENER OPCION DE APUESTA

  # Metodo que elija entre Rojo, Negro o Verde con probabilidades 2%, 49% y 49% . get_bet_choice, get_bet_option ➝ 'green' | 'red' | 'black'
  def get_bet_choice
    value = get_random_value(1,100)
    if value > 0 && value < 3
      return 'green'
    elsif value >= 3 && value < 52
      return 'red'
    else
      return 'black'
    end
  end

  # GENERAR APUESTA
  # Metodo que llame a get_bet_amount  y get_bet_choice  . Bet.create(amount, choice, round_id, id)
  def make_bet
    amount = get_bet_ammount()
    choice = get_bet_choice()
    Bet.create(round_id: 2, jugador_id: 39, jugador_name: choice, bet_ammount: amount, bet_number: nil )
  end

end