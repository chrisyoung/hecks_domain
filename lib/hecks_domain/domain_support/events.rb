require_relative 'events/domain_event_publisher'
require_relative 'events/domain_event'

class HecksDomain
  module Events
    def self.subscribe(subscriber)
      DomainEventPublisher.subscribe(subscriber)
    end
  end
end