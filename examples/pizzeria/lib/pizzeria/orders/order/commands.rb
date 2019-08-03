Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module Pizzeria
  module Orders
    class Order
      module Commands
      end
    end
  end
end
