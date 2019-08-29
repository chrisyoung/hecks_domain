module LeanCoffee
  module Discussions
    class Discussion
      module Factories
        class Default
          def self.factory(args={})
            timeboxes = args.delete(:time_boxes)
            Discussion.new(args)
          end
        end
      end
    end
  end
end