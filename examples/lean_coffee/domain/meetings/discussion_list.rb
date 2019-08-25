require_relative 'discussion_list/factories'
require_relative 'discussion_list/invariants'

module LeanCoffee
  module Meetings
    class DiscussionList
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader 

      def initialize(positions: [])
        @positions = positions
      end

      def positions
        @positions.clone.freeze
      end

      private

      attr_writer :positions
    end
  end
end
