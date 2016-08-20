require 'spec_helper'

describe XpTeamWise::Optimizer::Chromossome do
  let(:project1) { FactoryGirl.build(:project) }
  let(:project2) { FactoryGirl.build(:project) }
  let(:project3) { FactoryGirl.build(:project) }

  let(:projects) { [project1, project2, project3]}

  let(:coach1) { FactoryGirl.build(:member, :coach, projects: projects.shuffle) }
  let(:coach2) { FactoryGirl.build(:member, :coach, projects: projects.shuffle) }
  let(:coach3) { FactoryGirl.build(:member, :coach, projects: projects.shuffle) }
  let(:member1) { FactoryGirl.build(:member, projects: projects.shuffle) }
  let(:member2) { FactoryGirl.build(:member, projects: projects.shuffle) }
  let(:member3) { FactoryGirl.build(:member, projects: projects.shuffle) }

  let(:members) { [coach1, coach2, coach3, member1, member2, member3] }

  subject { described_class.new(members) }

  describe 'initialize' do
    # Not close to a good test, but ensure no runtime errors
    it 'is expected to receive a members list' do
      described_class.new(members)
    end
  end
end