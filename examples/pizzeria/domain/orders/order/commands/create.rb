module Pizzeria
  module Orders
    class Order
      module Commands
        class Create
          attr_reader :head, :args
          def initialize(order)
            @head = order
            @args = args
            @order = order
          end

          def call
            @order.save
          end
        end
      end
    end
  end
end