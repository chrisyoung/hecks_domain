describe 'Playground' do
  let(:domain) do
    Domain.domain(:Pizzeria) do
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
        end
      end
    end
  end
    
  it 'builds the domain' do    
    domain.build
    domain.dump

    chef = Pizzeria::Pizzas::Chef.new(
      name: { value: 'Tom' }
    )

    chef_id = chef.save

    pizza = Pizzeria::Pizzas::Pizza.new(
      name: { value: "Hello" },
      toppings: [{ name: 'pepperoni' }],
      named_by: { name: { value: 'karl' } },
      description: { value: 'okay' }
    )

    pizza.save
    gotten = Pizzeria::Pizzas::Pizza.fetch(pizza.id)
    puts gotten.named_by

    expect(gotten.name.value).to eq('Hello')
  end
end