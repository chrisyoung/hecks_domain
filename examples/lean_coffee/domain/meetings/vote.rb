
module LeanCoffee
  module Meetings
    class Vote

      attr_reader :discussion

      def initialize(discussion:)
        @discussion = discussion
      end

      private

      attr_writer :discussion
    end
  end
end
