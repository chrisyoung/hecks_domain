require 'spec_helper'
describe Pizzeria::Orders::Order do
  let(:line_item) do 
    {
      pizza_name: 'Pepperoni',
      quantity: 1,
      price: 1.00
    }
  end

  subject { described_class.new(line_items: [line_item]) }

  describe '#line_items' do
    it do
      expect(subject.line_items.first)
        .to be_a Pizzeria::Orders::LineItem
    end
  end
end