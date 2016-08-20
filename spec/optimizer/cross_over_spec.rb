require 'spec_helper'

describe XpTeamWise::Optimizer::CrossOver do
  describe 'class method' do
    describe 'apply' do
      let(:population) { XpTeamWise::Optimizer::Population.new(size: 4, members: [FactoryGirl.build(:member)]) }

      before do
        population.chromossomes.each { |chromossome| chromossome.score = 1 }
      end

      it 'is expected to produce new chromossomes' do
        described_class.apply(population)

        expect(population.chromossomes).to all be_a(XpTeamWise::Optimizer::Chromossome)
        expect(population.chromossomes.count).to eq(4)
        expect(population.chromossomes[2].score).to be_nil
        expect(population.chromossomes[3].score).to be_nil
      end
    end
  end
end
