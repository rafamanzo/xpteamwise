require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Optimizer::Population do
  subject { described_class.new(size: 1, members: [FactoryGirl.build(:member)]) }

  describe 'attribute' do
    include_examples 'has attribute', 'chromossomes'
  end

  describe 'method' do
    describe 'fittest' do
      it 'is expected to return a Chromossome' do
        expect(subject.fittest).to be_a(XpTeamWise::Optimizer::Chromossome)
      end
    end
  end
end