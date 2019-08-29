module LeanCoffee
  module Topics
    class Timebox
      module Factories
        class Default
          def self.factory(args={})
            Timebox.new(
              {
                extension: Extension.new(
                  yes_votes: 0,
                  no_votes: 0
                )
              }.merge(args)
            )
          end
        end
      end
    end
  end
end