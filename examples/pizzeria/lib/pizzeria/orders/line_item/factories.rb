Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }

module Pizzeria
  module Orders
    class LineItem
      module Factories
      end
    end
  end
end