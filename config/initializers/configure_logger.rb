App.logger.formatter = proc do |severity, datetime, progname, msg|
  "[#{severity}] #{msg}\n"
end
App.logger.level = (App.env == 'production' ? Logger::DEBUG : Logger::INFO)