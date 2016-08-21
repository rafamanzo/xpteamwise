module XpTeamWise
  module Optimizer
    class Population
      attr_reader :chromossomes

      def initialize(size: 0, members: [])
        @size = size
        @members = members

        reset!
      end

      def fittest
        Ranker.rank(self)
        self.sort
        self.chromossomes.first
      end

      def sort
        self.chromossomes.sort! { |one, another| another.score <=> one.score }
      end

      def reset!
        @chromossomes = []
        (1..@size).each { |_| @chromossomes << Chromossome.new(@members) }
      end
    end
  end
end