module XpTeamWise
  module Optimizer
    class Population
      attr_reader :chromossomes

      def initialize(size: 0, members: [])
        @chromossomes = []
        (1..size).each { |_| @chromossomes << Chromossome.new(members) }
      end

      def fittest
        self.sort
        self.chromossomes.first
      end

      def sort
        self.chromossomes.sort! { |one, another| another.score <=> one.score }
      end
    end
  end
end