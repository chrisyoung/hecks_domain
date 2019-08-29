module LeanCoffee
  module Meetings
    class Meeting
      module Subscribers
        class TopicExtensionTimeboxEnded
          def self.domain_event
            LeanCoffee::Meetings::Meeting::Events::TopicExtensionTimeboxEnded
          end

          def self.notify(event)
            event.head.wait_for_extension_vote!
          end

          HecksDomain::Events::DomainEventPublisher.subscribe(self)
        end
      end
    end
  end
end
