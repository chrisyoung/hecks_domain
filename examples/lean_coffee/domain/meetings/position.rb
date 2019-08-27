
module LeanCoffee
  module Meetings
    class Position

      attr_reader :discussion

      def initialize(discussion:)
        @discussion = discussion
      end

      private

      attr_writer :discussion
    end
  end
end
