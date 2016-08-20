require 'spec_helper'
require 'support/shared_examples_for_attributes'

describe XpTeamWise::Data::Project do
  describe 'attribute' do
    include_examples 'has attribute', 'name'
  end

  describe 'method' do
    describe '==' do
      context 'with same name projects' do
        let(:one) { described_class.new(name: 'same name') }
        let(:another) { described_class.new(name: 'same name') }

        it 'is expected to return true' do
          expect(one == another).to eq(true)
        end
      end

      context 'with different name projects' do
        let(:one) { described_class.new(name: 'one name') }
        let(:another) { described_class.new(name: 'another name') }

        it 'is expected to return false' do
          expect(one == another).to eq(false)
        end
      end
    end
  end
end
