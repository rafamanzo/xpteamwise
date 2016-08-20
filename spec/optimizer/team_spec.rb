require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Optimizer::Team do
  let(:project) { FactoryGirl.build(:project) }
  let(:member) { FactoryGirl.build(:member, projects: [project]) }
  let(:coach) { FactoryGirl.build(:member, :coach, projects: [project]) }
  subject { described_class.new(project, [member, coach]) }

  describe 'attribute' do
    include_examples 'has attribute', 'project'
    include_examples 'has attribute', 'members'
  end

  describe 'method' do
    describe 'to_s' do
      it 'is expected to print the team information into a string' do
        expectation = "#{project.name}\n\t- #{member.name}\n\t* #{coach.name}"

        expect(subject.to_s).to eq(expectation)
      end
    end
  end
end
