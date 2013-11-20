Dir[File.join(File.dirname(__FILE__), 'lib/tasks/**/*.rb')].each {|task| require task }

desc 'Loads the application environment'
task :environment do
  require File.join(File.dirname(__FILE__), 'config/environment')
end