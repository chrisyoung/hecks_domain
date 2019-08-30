module LeanCoffee
  module Meetings
    class Meeting
      class MeetingTimer
        def self.start(duration, meeting)
          Thread.new do
            sleep duration * 60

            HecksDomain::Events::DomainEventPublisher.emit(
              Meeting::Events::TimeboxEnded.new(head: meeting, args: {})
            )
          end
        end
      end
    end
  end
end
