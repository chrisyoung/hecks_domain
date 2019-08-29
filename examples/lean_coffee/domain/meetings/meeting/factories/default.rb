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
                participants: args[:participants].map do |participant|
                  LeanCoffee::Meetings::Participant.new(
                    name: participant[:name],
                    remaining_votes: allowed_votes
                  )
                end,
                discussion: Discussions::Discussion.default,
                timebox: Timebox.zeroed
              )
            )
          end
        end
      end
    end
  end
end