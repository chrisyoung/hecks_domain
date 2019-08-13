require_relative 'tied_result/factories'
require_relative 'tied_result/invariants'

module SoccerSeason
  module Matches
    class TiedResult
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader 

      def initialize()
      end

      private

      attr_writer 
    end
  end
end
