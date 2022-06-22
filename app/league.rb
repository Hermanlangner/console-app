require "ostruct"
require_relative "./models/leaderboard"
require_relative "./models/rank"
require_relative "./models/team_result"
require_relative "./object_factories/team_result_factory"
require_relative "./services/ranker"

module League
  module_function

  def run_league(games)
    leaderboard = Models::Leaderboard.new
    games.each do |game|
      team_results = ObjectFactories::TeamResultFactory.create(game)
      leaderboard.update_match_results(team_results)
    end

    rankings = Services::Ranker.rank_leaderboard(leaderboard.board)
    puts rankings
  end
end
