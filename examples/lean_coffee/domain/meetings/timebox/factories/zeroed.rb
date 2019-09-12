module LeanCoffee
  module Domain
    module Meetings
      class Timebox
        module Factories
          class Zeroed
            def self.factory(args = {})
              Timebox.new(
                voting_duration: 0,
                collection_duration: 0,
                ordering_duration: 0,
                topic_discussion_duration: 0,
                topic_extension_duration: 0
              )
            end
          end
        end
      end
    end
  end
end