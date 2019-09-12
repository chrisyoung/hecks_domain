module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        class ExtensionTimer
          def self.start(meeting)
            Thread.new do
              sleep meeting.timebox.topic_extension_duration * 60

              Support::Events::DomainEventPublisher.emit(
                Events::TopicExtensionTimeboxEnded.new(root: meeting, args: {})
              )
            end
          end
        end
      end
    end
  end
end