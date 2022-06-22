require "bundler/setup"
require "pry"
require "factory_bot"
require_relative "../app/league"

require "simplecov"
SimpleCov.start if ENV["COVERAGE"]

require "codecov"
SimpleCov.formatter = SimpleCov::Formatter::Codecov if ENV["COVERAGE"]

module Rails
  def self.env
    "test"
  end
end

Bundler.setup

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    #FactoryBot.find_definitions
  end
end
