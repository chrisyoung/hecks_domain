module Pizzeria
  module Orders
    class Order
      module Commands
        class AddPizza
          attr_reader :head, :args

          def initialize(order, pizza)
            @order = order
            @pizza = pizza
          end

          def call
            @order.line_items << LineItem.new(
              pizza_name: @pizza.name,
              quantity: 1,
              price: @pizza.price
            )
            @order.save
          end
        end
      end
    end
  end
end