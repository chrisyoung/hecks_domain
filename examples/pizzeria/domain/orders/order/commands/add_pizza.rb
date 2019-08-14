module Pizzeria
  module Orders
    class Order
      module Commands
        class AddPizza
          attr_reader :head, :args, :pizza, :quantity

          def initialize(order, pizza)
            @order = order
            @pizza = pizza
            @quantity = 1
          end

          def call
            tap do |command|
              @order.instance_eval do
                @line_items << LineItem.new(
                  pizza_name: command.pizza.name,
                  quantity: command.quantity,
                  price: command.pizza.price
                )
              end
            end

            @order.save!
          end
        end
      end
    end
  end
end