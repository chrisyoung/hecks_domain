module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class Save
            attr_reader :args, :root

            def initialize(root)
              @root = root
            end

            def call
              @id = @root.class::Repository.save(@root)
              self
            end
          end
        end
      end
    end
  end
end
