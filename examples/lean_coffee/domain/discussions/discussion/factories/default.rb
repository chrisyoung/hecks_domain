module LeanCoffee
  module Discussions
    class Discussion
      module Factories
        class Default
          def self.factory(args={})
            timeboxes = args.delete(:time_boxes)
            Discussion.new(
              args.merge(votes: 0)
            )
          end
        end
      end
    end
  end
end