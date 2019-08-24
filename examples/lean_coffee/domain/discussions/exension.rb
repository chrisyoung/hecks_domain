require_relative 'exension/factories'
require_relative 'exension/invariants'

module LeanCoffee
  module Discussions
    class Exension
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

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
