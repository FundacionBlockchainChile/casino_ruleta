# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Roullette.create(roullette_wallet:0,time_delay:60)
Round.create(roullette_id:Roullette.last.id,winner_color:'red')
Round.create(roullette_id:Roullette.last.id,winner_color:'green')
Round.create(roullette_id:Roullette.last.id,winner_color:'black')
Jugador.create(nombre: 'Test Name', email: 'test@example.com',total_billetera:10000)
Bet.create(round_id: Round.last.id, jugador_id: Jugador.last.id, bet_ammount: 1000, bet_color: 'green')

