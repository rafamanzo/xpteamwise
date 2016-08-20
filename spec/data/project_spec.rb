require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Data::Project do
  describe 'attribute' do
    include_examples 'has attribute', 'name'
  end
end
