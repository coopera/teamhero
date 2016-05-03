RSpec.shared_examples 'event counter' do |event_type|
  describe ".count" do
    before do
      allow(described_class).to receive(:get)
        .with(request_path, options)
        .and_return(response)
    end

    let(:username) { 'username' }

    let(:request_path) { "/count/#{event_type}" }
    let(:options) do
      {query: {author: username}}
    end

    let(:response) do
      10
    end

    subject { described_class.count(username) }

    it { is_expected.to eq 10 }

  end
end
