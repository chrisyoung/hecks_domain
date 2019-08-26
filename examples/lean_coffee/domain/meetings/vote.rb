require_relative 'vote/factories'
require_relative 'vote/invariants'

module LeanCoffee
  module Meetings
    class Vote
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_reader :discussion

      def initialize(discussion:)
        @discussion = discussion
      end

      private

      attr_writer :discussion
    end
  end
end
