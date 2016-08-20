require 'spec_helper'

describe XpTeamWise::Optimizer do
  describe 'method' do
    describe 'run' do
      let(:population) { XpTeamWise::Optimizer::Population.new(size: 4, members: [FactoryGirl.build(:member)]) }

      it 'is expected to run until there is a good candidate' do
        team = double('Team')
        expect(team).to receive(:has_coach?).and_return(true)
        expect(team).to receive(:respect_sizes?).and_return(true)

        expect(population.chromossomes.first).to receive(:teams).and_return([team])

        expect(population).to receive(:fittest).and_return(population.chromossomes.first).exactly(2).times

        described_class.run(population)
      end
    end
  end
end
