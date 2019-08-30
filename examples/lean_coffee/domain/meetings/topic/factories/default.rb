module LeanCoffee
  module Meetings
    class Topic
      module Factories
        class Default
          def self.factory(args={})
            Topic.new(
              args.merge(votes: 0)
            )
          end
        end
      end
    end
  end
end