module XpTeamWise
  module Optimizer
    class CrossOver
      class << self
        def apply(population)
          breeders = population.chromossomes.take(population.chromossomes.count/2)
          population.chromossomes.pop(population.chromossomes.count/2)

          breeders.shuffle!
          while !breeders.empty?
            population.chromossomes.concat(merge(breeders[0], breeders[1]))
            breeders = breeders.drop(2)
          end
        end

        private

        def merge(parent1, parent2)
          child1 = Chromossome.new(parent1.members)
          child1.genes.clear
          child2 = Chromossome.new(parent2.members)
          child2.genes.clear

          cross_over_position = rand(parent1.genes.count)

          child1.genes.concat(parent1.genes[0..cross_over_position])
          child1.genes.concat(parent2.genes[(cross_over_position + 1)..-1])
          child2.genes.concat(parent2.genes[0..cross_over_position])
          child2.genes.concat(parent1.genes[(cross_over_position + 1)..-1])

          return child1, child2
        end
      end
    end
  end
end