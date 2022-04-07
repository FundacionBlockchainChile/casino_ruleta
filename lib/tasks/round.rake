namespace :rounds do
  desc 'Creates new round and makes bets for all players'
  task create_new_round: :environment do
    puts 'Playing new round...'
    round = Round.new
    round.play_new_round
  end
end