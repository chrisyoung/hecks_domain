module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Factories
          class Default
            def self.factory(args = {})
              args.delete(:time_boxes)
              allowed_votes = args.delete(:allowed_votes)

              Meeting.new(
                args.merge(
                  participants: args[:participants].map do |participant|
                    Participant.new(
                      name: participant[:name],
                      remaining_votes: allowed_votes
                    )
                  end,
                  discussion: Discussion.default,
                  timebox: Timebox.zeroed,
                  phase: :waiting
                )
              )
            end
          end
        end
      end
    end
  end
end