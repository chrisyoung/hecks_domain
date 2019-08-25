module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class AddDiscussion
          attr_reader :args, :head

          def initialize(meeting, args)
            @meeting = meeting
            @discussion_list = @meeting.discussion_list
            @topic = args[:topic]
          end

          def call
            position = LeanCoffee::Meetings::Position.new(
              discussion: LeanCoffee::Discussions::Discussion.default(
                topic: @topic,
                timebox: LeanCoffee::Discussions::Timebox.new(
                  duration: 5, extension: 1
                )
              )
            )

            @discussion_list.instance_eval do
              @positions << position
            end

            self
          end
        end
      end
    end
  end
end

