describe 'TopLevelMethods' do
  describe '#domain' do
    it 'can be called at the top level binding' do
      expect(Domain).to receive(:domain)
      domain('Pizzeria')
    end
  end
end