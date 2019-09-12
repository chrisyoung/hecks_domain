module LeanCoffee
  module Domain
    module Meetings
      class Participant
        
        include Support::DomainObject

        attr_reader :name, :remaining_votes

        def initialize(name:, remaining_votes:, topic_votes: [])
          @name = name
          @remaining_votes = remaining_votes
          @topic_votes = topic_votes
        end

        def topic_votes
          @topic_votes.clone.freeze
        end

        private

        attr_writer :name, :remaining_votes, :topic_votes
      end
    end
  end
end
