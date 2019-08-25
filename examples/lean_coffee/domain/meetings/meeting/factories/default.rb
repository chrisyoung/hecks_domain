module LeanCoffee
  module Meetings
    class Meeting
      module Factories
        class Default
          def self.factory(args={})
            timeboxes = args.delete(:time_boxes)
            allowed_votes = args.delete(:allowed_votes)

            Meeting.new(
              args.merge(
                phase: :collecting,
                participants: args[:participants].map do |participant|
                  LeanCoffee::Meetings::Participant.new(
                    name: participant[:name],
                    remaining_votes: allowed_votes
                  )
                end,
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