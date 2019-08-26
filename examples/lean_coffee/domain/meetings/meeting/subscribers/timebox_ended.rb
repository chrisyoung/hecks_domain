module LeanCoffee
  module Meetings
    class Meeting
      module Subscribers
        class TimeboxEnded
          def self.domain_event
            LeanCoffee::Meetings::Meeting::Events::TimeboxEnded
          end

          def self.notify(event)
            event.head.wait_for_next_phase!
          end

          HecksDomain::Events::DomainEventPublisher.subscribe(
            Subscribers::TimeboxEnded
          )
        end
      end
    end
  end
end
