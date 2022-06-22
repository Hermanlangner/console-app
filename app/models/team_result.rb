module League
  module Models
    class TeamResult
      attr_reader :name, :points

      def initialize(name, points)
        @name = name
        @points = points
      end
    end
  end
end
