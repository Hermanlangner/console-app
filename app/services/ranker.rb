module League
  module Services
    module Ranker
      class << self
        def rank_leaderboard(leaderboard)
          #get teams paired for rankings
          grouped_board = leaderboard.group_by { |k, v| v }. #group based on points
            map { |points, name_tuple| [points, name_tuple.map { |tuple| tuple[0] }.sort] }.
            to_h

          #sort to get the descending keys first
          sorted_board = grouped_board.sort.reverse!
          index = 1
          sorted_board.map do |row|
            ranks = row[1].map { |name| Models::Rank.new(name, row[0], index) }
            index += row[1].size
            ranks
          end.flatten
        end
      end
    end
  end
end
