module XpTeamWise
  module Optimizer
    class CrossOver
      RATIO=0.1

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

          cross_over_positions = []
          (1..(RATIO*parent1.genes.count).round).each { |_| cross_over_positions << rand(parent1.genes.count - 1) }
          cross_over_positions.sort! << -1

          flip = false
          start = 0
          cross_over_positions.each do |cross_over_position|
            if(flip)
              child1.genes.concat(parent2.genes[start..cross_over_position])
              child2.genes.concat(parent1.genes[start..cross_over_position])
            else
              child1.genes.concat(parent1.genes[start..cross_over_position])
              child2.genes.concat(parent2.genes[start..cross_over_position])
            end

            flip = !flip
            start = cross_over_position + 1
          end

          return child1, child2
        end
      end
    end
  end
end