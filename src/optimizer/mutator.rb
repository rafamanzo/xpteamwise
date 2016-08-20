module XpTeamWise
  module Optimizer
    class Mutator
      class << self
        def apply(population)
          chromossome_index = rand(population.chromossomes.count)
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