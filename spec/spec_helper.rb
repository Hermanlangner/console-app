require "bundler/setup"
require "pry"
require "factory_bot"
#$LOAD_PATH << '../'
require_relative "../console_app/dummy"
require "simplecov"
SimpleCov.start if

  require "codecov"
SimpleCov.formatter = SimpleCov::Formatter::Codecov if ENV["COVERAGE"]

module Rails
  def self.env
    "test"
  end
end

Bundler.setup

RSpec.configure do |config|
end
