
module LeanCoffee
  module Meetings
    class Participant

      attr_reader :name, :remaining_votes

      def initialize(name:, remaining_votes:, votes: [])
        @name = name
        @remaining_votes = remaining_votes
        @votes = votes
      end

      def votes
        @votes.clone.freeze
      end

      private

      attr_writer :name, :remaining_votes, :votes
    end
  end
end
