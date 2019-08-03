module Pizzeria
  module Helpers
    module FactoryLoader
      def self.included(base)
        # require 'pry'
        # binding.pry
        base::Factories.constants.each do |constant|
          base.class_eval "
            def #{constant.to_s.underscore}(*args)
              Factories::#{constant}.factory(self, *args)
            end
          "
        end
      end
    end
  end
end
