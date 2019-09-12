module LeanCoffee
  module Domain
    module Meetings
      class TopicTimebox
        module Factories
          class Zeroed
            def self.factory(args = {})
              TopicTimebox.default(duration: 0, extension: 0)
            end
          end
        end
      end
    end
  end
end