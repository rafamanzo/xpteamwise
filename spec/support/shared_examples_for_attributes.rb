RSpec.shared_examples "has attribute" do |attribute|
  describe attribute do
    it 'is expected to be readable' do
      expect(subject.respond_to?(attribute)).to be_truthy
    end
  end
end
