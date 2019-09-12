module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class KeepTalking
            attr_reader :args, :root

            def initialize(root)
              @root = root
            end

            def call
              ExtensionTimer.start(@root)
              @root.instance_eval do
                @phase = :discussing_topic
              end
              self
            end
          end
        end
      end
    end
  end
end