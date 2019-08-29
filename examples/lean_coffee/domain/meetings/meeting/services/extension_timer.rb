module LeanCoffee
  module Meetings
    class Meeting
      class ExtensionTimer
        def self.start(meeting)
          Thread.new do
            sleep meeting.timebox.topic_extension_duration * 60

            HecksDomain::Events::DomainEventPublisher.emit(
              Events::TopicExtensionTimeboxEnded.new(head: meeting, args: {})
            )
          end
        end
      end
    end
  end
end
