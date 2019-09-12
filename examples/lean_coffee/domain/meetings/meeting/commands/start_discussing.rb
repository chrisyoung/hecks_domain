module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class StartDiscussing
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              @root.instance_eval do
                @phase = :discussing
              end

              self
            end
          end
        end
      end
    end
  end
end
