describe 'Playground' do
  let(:pizza) do
    Pizzeria::Pizzas::Pizza.new(
      name: {value: "Hello"},
      toppings: [{ name: 'pepperoni' }],
      named_by: { name: { value: 'karl' } }, 
      description: { value: 'okay' }
    )
  end
  
  before do
    domain(:Pizzeria) do
      aggregate :Pizzas do
        head :Pizza do 
          value(:name).as :PizzaName
          value(:description).as :PizzaDescription
          entity(:named_by).as :Chef
          list(:toppings).as :Topping
        end
        entity(:Chef) { value(:name).as :ChefName }
        value(:ChefName) { string :value }
        value(:Topping) { string :name }
        value(:PizzaName) { string :value }
        value(:PizzaDescription) { string :value }
      end
    
      aggregate :Orders do
        head(:Order) { list(:line_items).as :LineItem }
        value :LineItem do
          string :pizza_name
          integer :quantity
          currency :price
          optional string :foo
          reference(:pizza).as Pizzas: :Pizza
        end
      end
    end.tap do |domain|
      domain.activate
      domain.dump
    end
  end
  
  it 'builds the domain' do
    expect(pizza.name.value).to eq('Hello')
  end
end 