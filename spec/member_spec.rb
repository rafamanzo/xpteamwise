require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Member do
  describe 'attribute' do
    include_examples 'has attribute', 'name'
    include_examples 'has attribute', 'email'
    include_examples 'has attribute', 'coach'
    include_examples 'has attribute', 'projects'
  end
end
