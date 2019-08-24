require_relative '../spec_helper'

describe FooBar::Foos::Foo do
  subject { described_class.new(bar: FooBar::Foos::Bar.new(name: 'bar')) }
  describe '#bar' do
    it 'bars' do
      expect(subject.bar.name).to eq 'bar'
    end
  end
end