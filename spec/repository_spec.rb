require 'spec_helper'

describe TestApp::Domain::Users::User do
  describe '#all' do
    let!(:fred) { described_class.create(name: 'Fred') }

    it 'should list all users created' do
      expect(described_class.all).to eq [fred]
    end
  end
end
