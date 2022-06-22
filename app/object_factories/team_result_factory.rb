module League
  module ObjectFactories
    class TeamResultFactory
      class << self
        def create(game)
          #simplified because of clean input assumption
          teams = split_game(game).map do |team|
            split = team.split(/(\s\d+)/).map(&:strip)
            OpenStruct.new(name: split[0], score: split[1].to_i)
          end
          decide_game(teams[0], teams[1])
        end

        private

        def split_game(game)
          game.split(",")
        end

        #probably should extract this and probably shuffle things around but its not worth it at this point
        def decide_game(team_1, team_2)
          if team_1.score == team_2.score
            [Models::TeamResult.new(team_1.name, 1), Models::TeamResult.new(team_2.name, 1)]
          elsif team_1.score > team_2.score
            [Models::TeamResult.new(team_1.name, 3), Models::TeamResult.new(team_2.name, 0)]
          else
            [Models::TeamResult.new(team_1.name, 0), Models::TeamResult.new(team_2.name, 3)]
          end
        end
      end
    end
  end
end
