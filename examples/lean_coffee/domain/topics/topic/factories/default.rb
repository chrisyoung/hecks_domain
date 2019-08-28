module LeanCoffee
  module Topics
    class Topic
      module Factories
        class Default
          def self.factory(args={})
            timeboxes = args.delete(:time_boxes)
            Topic.new(
              args.merge(votes: 0)
            )
          end
        end
      end
    end
  end
end