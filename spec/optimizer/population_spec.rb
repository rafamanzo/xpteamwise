require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Optimizer::Population do
  let(:size) { 4 }
  subject { described_class.new(size: size, members: [FactoryGirl.build(:member)]) }

  describe 'attribute' do
    include_examples 'has attribute', 'chromossomes'
  end

  describe 'initialize' do
    it 'is expected to have created the size argument count of Chromossomes' do
      expect(subject.chromossomes.count).to eq(size)
    end
  end

  describe 'method' do
    describe 'fittest' do
      it 'is expected to return a Chromossome' do
        expect(subject.fittest).to be_a(XpTeamWise::Optimizer::Chromossome)
      end
    end

    describe 'sort' do
      before do
        subject.chromossomes[0].score = 1
        subject.chromossomes[1].score = 2
        subject.chromossomes[2].score = 3
        subject.chromossomes[3].score = 0
      end

      it 'is expected to sort the Chromossomes into descendant order' do
        subject.sort

        expect(subject.chromossomes.map(&:score)).to eq([3,2,1,0])
      end
    end
  end
end