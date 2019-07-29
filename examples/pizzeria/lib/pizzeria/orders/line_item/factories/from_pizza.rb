module Pizzeria
  module Orders
    class LineItem
      module Factories
        def self.from_pizza(pizza)
          LineItem.new(
            pizza_name: pizza.name, 
            quantity: 1, 
            price: pizza.price
          )
        end
      end
    end
  end
end