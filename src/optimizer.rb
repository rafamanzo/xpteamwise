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
        continue = true
        iterations = 0

        population.fittest
        begin
          CrossOver.apply(population)
          Mutator.apply(population)

          fittest = population.fittest

          all_bonus = true
          fittest.teams.each do |team|
            all_bonus = all_bonus && team.has_coach? && team.respect_sizes?(Ranker::MIN_SIZE, Ranker::MAX_SIZE)
          end

          # This will not get tracked for coverage as the tests are not expected to iterate that much
          # :nocov:
          if iterations == 1000
            puts "\nIterated 1000 times!"
            puts "Fittest score: #{fittest.score}"
            fittest.teams.each do |team|
              puts "Could not find coach for #{team.project.name}" unless team.has_coach?
              puts "Could not find proper size for #{team.project.name}" unless team.respect_sizes?(Ranker::MIN_SIZE, Ranker::MAX_SIZE)
            end
            iterations = 0
          end
          # :nocov:

          iterations += 1
        end while !all_bonus && continue
      end
    end
  end
end
