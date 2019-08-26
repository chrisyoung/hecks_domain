require_relative 'position/factories'
require_relative 'position/invariants'

module LeanCoffee
  module Meetings
    class Position
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
