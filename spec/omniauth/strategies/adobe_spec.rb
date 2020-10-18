require 'spec_helper'
require 'omniauth-adobe'

RSpec.describe OmniAuth::Strategies::Adobe do
  let(:request) { double('Request') }
  let(:client_id) { 'foo' }
  let(:client_secret) { 'bar' }

  before :each do
    allow(request).to receive(:params).and_return({})
    allow(request).to receive(:cookies).and_return({})
  end

  subject do
    args = [client_id, client_secret, @options].compact
    OmniAuth::Strategies::Adobe.new(nil, *args).tap do |strategy|
      allow(strategy).to receive(:request).and_return(request)
    end
  end

  it_should_behave_like 'an oauth2 strategy'

  it 'has a version number' do
    expect(Omniauth::Adobe::VERSION).not_to be nil
  end

  describe '#client' do
    it 'should have the correct site' do
      expect(subject.client.site).to eq('https://ims-na1.adobelogin.com')
    end

    it 'should have the correct authorization url' do
      expect(subject.client.options[:authorize_url]).to eq('ims/authorize')
    end

    it 'should have the correct token url' do
      expect(subject.client.options[:token_url]).to eq('ims/token')
    end
  end

  describe '#callback_path' do
    it 'should have the correct callback path' do
      expect(subject.callback_path).to eq('/auth/adobe/callback')
    end
  end
end
