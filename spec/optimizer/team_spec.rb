require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Optimizer::Team do
  let(:project) { FactoryGirl.build(:project) }
  let(:member) { FactoryGirl.build(:member, projects: [project]) }
  let(:coach) { FactoryGirl.build(:member, :coach, projects: [project]) }
  subject { described_class.new(project: project, members: [member, coach]) }

  describe 'attribute' do
    include_examples 'has attribute', 'project'
    include_examples 'has attribute', 'members'
  end

  describe 'method' do
    describe 'to_s' do
      before do
        expect(XpTeamWise::Optimizer::Ranker).to receive(:score_team).and_return(42)
      end

      it 'is expected to print the team information into a string' do
        expectation = "#{project.name} (score: 42)\n\t- #{member.name} (1)\n\t* #{coach.name} (1)"

        expect(subject.to_s).to eq(expectation)
      end
    end

    describe 'has_coach?' do
      context 'when it has a coach' do
        it 'is expected to return true' do
          expect(subject.has_coach?).to be_truthy
        end
      end

      context 'when it has no coach' do
        before do
          subject.members.delete(coach)
        end

        it 'is expected to return falsey' do
          expect(subject.has_coach?).to be_falsey
        end
      end
    end

    describe 'respect_sizes?' do
      context 'when it is of a proper size' do
        it 'is expected to return true' do
          expect(subject.respect_sizes?(0,2)).to be_truthy
          expect(subject.respect_sizes?(2,4)).to be_truthy
        end
      end

      context 'when it is not of a proper size' do
        it 'is expected to return true' do
          expect(subject.respect_sizes?(3,4)).to be_falsey
        end
      end
    end
  end
end
