module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Queries
          class FindParticipant
            def self.query(meeting, params)
              meeting.participants.find do |participant|
                participant.send(params.keys.first) == params[params.keys.first]
              end
            end
          end
        end
      end
    end
  end
end