module LeanCoffee
  module Meetings
    class Meeting
      module Factories
        class Example
          def self.factory(timeboxes)
              LeanCoffee::Meetings::Meeting.default(
                allowed_votes: 5,
                timebox_extension: 1,
                phase: :voting,
                discussion_list: LeanCoffee::Meetings::DiscussionList.new,
                time_boxes: timeboxes,
                participants: [{ name: 'Angie' }, { name: 'Chris' }],
              )
          end
        end
      end
    end
  end
end