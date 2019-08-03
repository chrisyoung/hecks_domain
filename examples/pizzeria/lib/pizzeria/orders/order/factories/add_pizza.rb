module Pizzeria
  module Orders
    class Order
      module Factories
        module AddPizza
          def self.factory(order, pizza)
            order.line_items << LineItem.new(
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