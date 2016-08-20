require 'spec_helper'

describe XpTeamWise::Data::Reader::CSVToData do
  describe 'class method' do
    describe 'read' do
      it 'is expected to read the sample data' do
        result = described_class.read('sample.csv')

        expect(result).to all(be_a(XpTeamWise::Data::Member))
      end
    end
  end
end
