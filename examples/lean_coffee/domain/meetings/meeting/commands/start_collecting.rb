module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class StartCollecting
          class Foo
            def self.bar(duration, meeting)
              Thread.new do
                sleep duration * 60

                HecksDomain::Events::DomainEventPublisher.emit(
                  Events::TimeboxEnded.new(head: meeting, args: {})
                )
              end
            end
          end
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            head = @head
            @meeting.instance_eval do
              @phase = :collecting
              @collection_timebox.instance_eval do
                @start_time = Time.now
                @end_time = @start_time + (@duration * 60)
                Foo.bar(@duration, head)
              end
            end
            self
          end
        end
      end
    end
  end
end
