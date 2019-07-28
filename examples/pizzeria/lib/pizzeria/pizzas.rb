require_relative 'pizzas/pizza'
require_relative 'pizzas/chef'
require_relative 'pizzas/chef_name'
require_relative 'pizzas/topping'
require_relative 'pizzas/pizza_name'
require_relative 'pizzas/pizza_description'

module Pizzeria
  module Pizzas
    def self.head
      Pizza
    end
  end
end
