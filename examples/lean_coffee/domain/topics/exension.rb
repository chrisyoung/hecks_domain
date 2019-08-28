
module LeanCoffee
  module Topics
    class Exension

      attr_reader :duration, :yes_votes, :no_votes

      def initialize(duration:, yes_votes:, no_votes:)
        @duration = duration
        @yes_votes = yes_votes
        @no_votes = no_votes
      end

      private

      attr_writer :duration, :yes_votes, :no_votes
    end
  end
end
