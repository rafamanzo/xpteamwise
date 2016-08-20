require 'spec_helper'

describe XpTeamWise::Data::Reader::CSVToData do
  describe 'initialization' do
    let(:path) { '/test/test.csv' }
    let(:first_row) { ['name', 'email', 'coach', 'project1', 'project2', 'project3'] }

    it 'is expected to load the CSV first column' do
      expect(CSV).to receive(:read).with(path).and_return([first_row])

      described_class.new(path)
    end
  end
end
