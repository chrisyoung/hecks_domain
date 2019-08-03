module Pizzeria
  module Orders
    class Order
      module Commands
        class Create
          def initialize(order)
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