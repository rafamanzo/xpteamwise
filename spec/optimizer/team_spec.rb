require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Optimizer::Team do
  subject { described_class.new(FactoryGirl.build(:project), [FactoryGirl.build(:member)]) }

  describe 'attribute' do
    include_examples 'has attribute', 'project'
    include_examples 'has attribute', 'members'
  end
end
