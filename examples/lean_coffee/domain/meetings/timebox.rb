require_relative 'timebox/factories'
require_relative 'timebox/invariants'

module LeanCoffee
  module Meetings
    class Timebox
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_reader :duration, :start_time, :end_time

      def initialize(duration:, start_time: nil, end_time: nil)
        @duration = duration
        @start_time = start_time
        @end_time = end_time
      end

      private

      attr_writer :duration, :start_time, :end_time
    end
  end
end
