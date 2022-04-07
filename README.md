# README

The app is live on:
https://nnode-casino-app.herokuapp.com/

* Ruby version
ruby 3.0.2p107

* PG Database creation
rails db:create

* Database initialization
rake db:migrate
rails db:seed

* Services (job queues, cache servers, search engines, etc.)
* Weather_service.rb
* app/lib/jugador.rake - Deposit to all Players 10.000 each 10 min. (Heroku tasks minor to 10 minutes have charge)
* app/lib/round.rake - Play a round of Bets, Choose the winner color - Pay all Bets by result.

* Deployment instructions
* $ heroku login
* $ heroku git:clone -a nnode-casino-app 
* $ cd nnode-casino-app
* $ git add .
* $ git commit -am "make it better"
* $ git push heroku master


