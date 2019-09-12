module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        class TopicDiscussionTimer
          def self.start(meeting)
            Thread.new do
              sleep meeting.timebox.topic_discussion_duration * 60

              Support::Events::DomainEventPublisher.emit(
                Events::TopicDiscussionTimeboxEnded.new(root: meeting, args: {})
              )
            end
          end
        end
      end
    end
  end
end