require_relative 'pizzas/commands'
require_relative 'pizzas/pizza'
require_relative 'pizzas/topping'
require_relative 'pizzas/pizza_name'
require_relative 'pizzas/pizza_description'

module Pizzeria
  module Pizzas
    include Helpers::CommandLoader
    
    def self.head
      Pizza
    end
  end
end
