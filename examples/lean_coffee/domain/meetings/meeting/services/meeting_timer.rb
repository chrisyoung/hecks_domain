module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        class MeetingTimer
          def self.start(duration, meeting)
            Thread.new do
              sleep duration * 60

              Support::Events::DomainEventPublisher.emit(
                Meeting::Events::TimeboxEnded.new(root: meeting, args: {})
              )
            end
          end
        end
      end
    end
  end
end