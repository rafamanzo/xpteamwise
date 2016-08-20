require_relative 'optimizer/team'
require_relative 'optimizer/chromossome'
require_relative 'optimizer/population'
require_relative 'optimizer/ranker'
require_relative 'optimizer/cross_over'

module XpTeamWise
  module Optimizer
    class << self
      def run(population)
        all_bonus = false

        population.fittest
        begin
          CrossOver.apply(population)

          fittest = population.fittest

          all_bonus = true
          fittest.teams.each do |team|
            all_bonus = all_bonus && team.has_coach? && team.respect_sizes?(Ranker::MIN_SIZE, Ranker::MAX_SIZE)
          end
        end while !all_bonus
      end
    end
  end
end
