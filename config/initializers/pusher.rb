# config/initializers/pusher.rb
require 'pusher'
    
Pusher.app_id = '1370374'
Pusher.key = 'b83ca9db118f5993e589'
Pusher.secret = 'a245ebb6288a8e24ada5'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

