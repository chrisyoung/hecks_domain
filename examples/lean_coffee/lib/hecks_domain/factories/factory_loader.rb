class HecksDomain
  module Factories
    module FactoryLoader
      def self.included(base)
        base::Factories.constants.each do |constant|
          
          base.class_eval "
            def #{constant.to_s.underscore}(*args)
              #{base}::Factories::#{constant}.factory(self, *args)
            end
          "
          base.instance_eval "
            def #{constant.to_s.underscore}(*args)
              #{base}::Factories::#{constant}.factory(*args)
            end
          "
        end
      end
    end
  end
end