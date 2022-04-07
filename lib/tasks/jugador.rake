namespace :jugadores do
  desc 'Deposit to all players'
  task deposit_to_all_players: :environment do
    puts 'Deposit to all players...'
    Jugador.deposit_to_all_players
  end
end