ActiveRecord::Base.logger = App.logger
ActiveRecord::Base.establish_connection ENV['DATABASE_URL']