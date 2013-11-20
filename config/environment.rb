ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

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
end
