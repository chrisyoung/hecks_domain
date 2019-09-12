module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Events
          class TimeboxEnded
            attr_reader :root, :args
            def initialize(root:, args:)
              @root = root
              @args = args
            end
          end
        end
      end
    end
  end
end