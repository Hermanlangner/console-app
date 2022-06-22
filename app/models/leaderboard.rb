module League
  module Models
    class Leaderboard
      attr_reader :board

      def initialize(board = {}) #poor mans Dependency Injection
        @board = board
      end

      def update_match_results(team_results)
        team_results.each do |team_result|
          if team_on_leaderboard?(team_result.name)
            current_points = @board[team_result.name]
            @board[team_result.name] = current_points + team_result.points
          else
            @board[team_result.name] = team_result.points
          end
        end
      end

      def team_on_leaderboard?(team_name)
        @board.key?(team_name)
      end
    end
  end
end
