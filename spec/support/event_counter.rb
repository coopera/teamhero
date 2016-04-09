RSpec.shared_examples 'event counter' do |event_type|
  describe ".count" do
    before do
      allow(described_class).to receive(:get)
        .with(request_path, options)
        .and_return(response)
    end

    let(:username) { 'username' }
    let(:repository) { 'test' }

    let(:request_path) { "/#{event_type}/count" }
    let(:options) do
      {query: {actor: username, repository: repository}}
    end

    let(:response) do
      {count: 10}.with_indifferent_access
    end

    subject { described_class.count(username, repository) }

    it { is_expected.to eq 10 }

  end
end
