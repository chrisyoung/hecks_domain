module LeanCoffee
  module Meetings
    class Meeting
      class TopicDiscussionTimer
        def self.start(meeting)
          Thread.new do
            sleep meeting.timebox.topic_discussion_duration * 60

            HecksDomain::Events::DomainEventPublisher.emit(
              Events::TopicDiscussionTimeboxEnded.new(head: meeting, args: {})
            )
          end
        end
      end
    end
  end
end
