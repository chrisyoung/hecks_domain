module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Factories
          class Example
            def self.factory
              LeanCoffee::Domain::Meetings::Meeting.default(
                allowed_votes: 5,
                timebox_extension: 1,
                phase: :voting,
                time_boxes: {voting: 0, collection: 0, ordering: 0},
                participants: [{ name: 'Angie' }, { name: 'Chris' }],
              )
            end
          end
        end
      end
    end
  end
end