$stdout.sync = $stderr.sync = true
ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV']
require 'ostruct'
require 'logger'
# Load ENV configuration. The precedence is: Existing (i.e. given in shell), .env.RACK_ENV, .env
Dotenv.load ".env.#{ENV['RACK_ENV']}", '.env'


module App
  Config = OpenStruct.new
  
  class << self
    def root
      @root ||= Pathname.new(File.dirname(__FILE__)).join('..').expand_path
    end

    def env
      @env ||= ENV['RACK_ENV']
    end

    attr_accessor :logger
  end
  # If the LOG_TO_FILE variable is not set, print the application log to STDOUT. Otherwise to log/RACK_ENV.log
  self.logger = Logger.new(ENV['LOG_TO_FILE'] ? root.join('log', "#{env}.log") : STDOUT)

  Dir[root.join('config/initializers/**/*.rb')].each {|initializer| require initializer }
  $LOAD_PATH.unshift root.join('lib')
  # Require the file in load path that matches the snake_case version of your App constant
  require to_s.gsub(/(\w)([A-Z])/, '\\1_\\2').downcase

  # Load our routes file, which is actually a Rack Endpoint if rack is available (i.e. running
  # inside an app server)
  require root.join('config/routes') if defined?(::Rack)
end