Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module Pizzeria
  module Pizzas
    class PizzaName
      module Invariants
      end
    end
  end
end
