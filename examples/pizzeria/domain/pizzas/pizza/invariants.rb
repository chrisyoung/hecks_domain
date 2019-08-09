Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module Pizzeria
  module Pizzas
    class Pizza
      module Invariants
      end
    end
  end
end
