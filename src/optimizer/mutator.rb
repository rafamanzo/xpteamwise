module XpTeamWise
  module Optimizer
    class Mutator
      ELITE_RATIO=0.1
      RATIO=0.1

      class << self
        def apply(population)
          elite_count = (ELITE_RATIO*population.chromossomes.count).round
          mutation_count = (RATIO*population.chromossomes.count).round

          (1..mutation_count).each do |_|
            chromossome_index = elite_count + rand(population.chromossomes.count - elite_count)
            gene_index = rand(population.chromossomes[chromossome_index].genes.count)

            population.
              chromossomes[chromossome_index].
              genes[gene_index] = rand(3)

            population.chromossomes[chromossome_index].score = nil
          end
        end
      end
    end
  end
end