require_relative 'orders/order'
require_relative 'orders/line_item'

module Pizzeria
  module Orders
    def self.head
      Order
    end
  end
end
