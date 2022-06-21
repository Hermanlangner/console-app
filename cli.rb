#!/usr/bin/env ruby
require "optparse"
options = {}
OptionParser.new do |parser|
  parser.on("-n", "--name NAME", "The name of the person") do |value|
    options[:name] = value
  end
  parser.on("-h", "--help", "Prints this help") do
    puts parser
    exit
  end
end.parse!
#puts "hello " + options[:name]
