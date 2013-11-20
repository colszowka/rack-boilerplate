ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV']
require 'ostruct'

module App
  Config = OpenStruct.new
  
  class << self
    def root
      @root ||= Pathname.new(File.dirname(__FILE__)).join('..').expand_path
    end

    def env
      @env ||= ENV['RACK_ENV']
    end
  end

  Dir[root.join('config/initializers/**/*.rb')].each {|initializer| require initializer }
  $LOAD_PATH.unshift root.join('lib')
  # Require the file in load path that matches the snake_case version of your App constant
  require to_s.gsub(/(\w)([A-Z])/, '\\1_\\2').downcase
end