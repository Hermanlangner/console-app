module League
  module Models
    class Rank
      attr_reader :name, :points, :rank

      def initialize(name, points, rank)
        @name = name
        @points = points
        @rank = rank
      end

      def to_s
        "#{rank}. #{name}, #{points} pts"
      end

      def inspect
        to_s
      end
    end
  end
end
