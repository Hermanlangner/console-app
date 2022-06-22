require "factory_bot"
require_relative "../../app/models/team_result"
FactoryBot.define do
  factory :team_result, class: League::Models::TeamResult do
    name { "default_name" }
    points { 5 }

    initialize_with { new(name, points) }
  end
end
