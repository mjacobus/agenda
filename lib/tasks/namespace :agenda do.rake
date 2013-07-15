namespace :agenda do
  desc 'Sends emails to all the users that have tasks on the current week'
  task :send_weekly_tasks_email => :environment do
    # UserNotifier.new.send_weekly_tasks_email
    puts "Not implemented yet"
  end

  desc 'Sends emails to all the users that have tasks on the current day'
  task :send_daily_tasks_email => :environment do
    # UserNotifier.new.send_daily_tasks_email
    puts "Not implemented yet"
  end
end