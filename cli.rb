#!/usr/bin/env ruby
require "optparse"
require "./app/league"

options = {}
OptionParser.new do |parser|
  parser.on("-i", "--input INPUT", "The path for the input file") do |value|
    options[:file_path] = value
  end
  parser.on("-h", "--help", "Prints this help") do
    puts parser
    exit
  end
end.parse!
#File.open('./local_test/input.txt').map(&:chomp)
if options[:file_path]
  games = File.open(options[:file_path]).map(&:chomp)
  League.run_league(games)
end
