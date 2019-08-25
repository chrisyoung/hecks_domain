module LeanCoffee
  module Meetings
    class Meeting
      module Factories
        class Default
          def self.factory(args={})
            timeboxes = args.delete(:time_boxes)
            Meeting.new(
              args.merge(
                voting_timebox: LeanCoffee::Meetings::Timebox.new(
                  duration: timeboxes[:voting]
                ),
                collection_timebox: LeanCoffee::Meetings::Timebox.new(
                  duration: timeboxes[:collection]
                ),
                ordering_timebox: LeanCoffee::Meetings::Timebox.new(
                  duration: timeboxes[:ordering]
                )
              )
            )
          end
        end
      end
    end
  end
end