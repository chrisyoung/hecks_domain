module LeanCoffee
  module Domain
    module Meetings
      class Extension
        
        include Support::DomainObject

        attr_reader :yes_votes, :no_votes

        def initialize(yes_votes:, no_votes:)
          @yes_votes = yes_votes
          @no_votes = no_votes
        end

        private

        attr_writer :yes_votes, :no_votes
      end
    end
  end
end
