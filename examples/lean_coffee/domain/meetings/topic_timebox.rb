module LeanCoffee
  module Domain
    module Meetings
      class TopicTimebox
        
        include Support::DomainObject

        attr_reader :duration, :extension

        def initialize(duration:, extension:)
          @duration = duration
          @extension = extension
        end

        private

        attr_writer :duration, :extension
      end
    end
  end
end
