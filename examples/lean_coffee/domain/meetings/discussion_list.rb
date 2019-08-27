
module LeanCoffee
  module Meetings
    class DiscussionList

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
