Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module Pizzeria
  module Pizzas
    class Pizza
      module Factories
      end
    end
  end
end
