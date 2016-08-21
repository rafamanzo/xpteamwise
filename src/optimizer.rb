require 'highline'

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
          if !all_bonus && iterations == 1000
            cli = HighLine.new

            cli.say "\nIterated 1000 times!"

            cli.say "\nFittest score: #{fittest.score}"
            fittest.teams.each do |team|
              cli.say "\tCould not find coach for #{team.project.name}" unless team.has_coach?
              cli.say "\tCould not find proper size for #{team.project.name}" unless team.respect_sizes?(Ranker::MIN_SIZE, Ranker::MAX_SIZE)
            end

            if cli.agree "\nDo you wish to erradicate this population? [y/n]"
              population.reset!
            else
              continue = cli.agree "\nDo you wish to continue? [y/n]"
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
