require "bundler/setup"
require "pry"
require "factory_bot"
#$LOAD_PATH << '../'
require_relative "../console_app/dummy"

module Rails
  def self.env
    "test"
  end
end

Bundler.setup

RSpec.configure do |config|
end
