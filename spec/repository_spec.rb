require 'spec_helper'

describe TestApp::Domain::Users::User do
  let!(:fred) { described_class.create(name: 'Fred') }
  describe '#all' do
    it 'should list all users created' do
      expect(described_class.all).to eq [fred]
    end
  end

  describe '#destroy' do
    it 'should destroy the provided user' do
      fred.destroy
      expect(described_class.all).to_not include(fred)
    end
  end
end
