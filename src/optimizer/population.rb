module XpTeamWise
  module Optimizer
    class Population
      attr_reader :chromossomes

      def initialize(size: 0, members: [])
        @chromossomes = []
        (0..size).each { |_| @chromossomes << Chromossome.new(members) }
      end

      def fittest
        self.chromossomes.first
      end
    end
  end
end