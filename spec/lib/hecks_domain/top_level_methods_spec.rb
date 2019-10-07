describe 'TopLevelMethods' do
  describe '#domain' do
    it 'can be called at the top level binding' do
      expect(HecksDomain).to receive(:parser)
      domain('Pizzeria')
    end
  end
end
