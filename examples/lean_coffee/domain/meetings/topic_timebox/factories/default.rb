module LeanCoffee
  module Domain
    module Meetings
      class TopicTimebox
        module Factories
          class Default
            def self.factory(args = {})
              TopicTimebox.new(
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
end