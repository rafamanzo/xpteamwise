require 'spec_helper'

describe XpTeamWise::Optimizer::Mutator do
  let(:size) { 30 }
  let(:population) { XpTeamWise::Optimizer::Population.new(size: size, members: FactoryGirl.build_list(:member, size)) }

  before do
    population.chromossomes.each { |chromossome| chromossome.score = 1 }
  end

  describe 'class method' do
    describe 'apply' do
      it 'is expected to mutate one gene for one chromossome' do
        described_class.apply(population)

        expect(population.chromossomes.count).to eq(size)

        score_nil = false
        population.chromossomes.each do |chromossome|
          score_nil = true if chromossome.score.nil?

          expect(chromossome.genes.count).to eq(size)
        end
      end
    end
  end
end