module Pizzeria
  module Orders
    class LineItem
      module Factories
        module FromPizza
          def self.factory(pizza)
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
end