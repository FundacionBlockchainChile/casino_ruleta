# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron_log.log"
#
every 3.minutes do
  rake 'rounds:create_new_round'
end

