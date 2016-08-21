require_relative 'optimizer/team'
require_relative 'optimizer/chromossome'
require_relative 'optimizer/population'
require_relative 'optimizer/ranker'
require_relative 'optimizer/cross_over'
require_relative 'optimizer/mutator'

module XpTeamWise
  module Optimizer
    class << self
      def run(population)
        all_bonus = false

        population.fittest
        begin
          CrossOver.apply(population)
          Mutator.apply(population)

          fittest = population.fittest
          puts "Fittest score: #{fittest.score}"

          all_bonus = true
          fittest.teams.each do |team|
            unless team.has_coach?
              all_bonus = false
              puts "Could not find coach for #{team.project.name}"
            end

            unless team.respect_sizes?(Ranker::MIN_SIZE, Ranker::MAX_SIZE)
              all_bonus = false
              puts "Could not find proper size for #{team.project.name}"
            end
          end
        end while !all_bonus
      end
    end
  end
end
