module LeanCoffee
  module Topics
    class Timebox
      module Factories
        class Zeroed
          def self.factory(args={})
            Timebox.new(duration: 0, extension: 0)
          end
        end
      end
    end
  end
end