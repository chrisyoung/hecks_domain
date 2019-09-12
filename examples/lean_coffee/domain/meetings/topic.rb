module LeanCoffee
  module Domain
    module Meetings
      class Topic
        
        include Support::DomainObject

        attr_reader :value, :votes, :timebox

        def initialize(value:, votes:, timebox:)
          @value = value
          @votes = votes
          @timebox = timebox
        end

        private

        attr_writer :value, :votes, :timebox
      end
    end
  end
end
