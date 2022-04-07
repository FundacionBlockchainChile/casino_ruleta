namespace :rounds do
  desc 'Creates new round and makes bets for all players'
  task create_new_round: :environment do
    puts 'Playing new round...'
    round = Round.new
    round.play_new_round
  end
end

namespace :rounds do
  desc 'Creates new round and makes bets for all players'
  task delete_rounds_without_winner: :environment do
    puts 'Deleting routs without winner...'
    Round.where(winner_color: nil).destroy_all
  end
end