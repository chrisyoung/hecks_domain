require_relative 'tied_result/factories'
require_relative 'tied_result/invariants'

module SoccerSeason
  module Matches
    class TiedResult
      include HecksDomain::Factories::FactoryLoader
      include Invariants
      
      

      attr_accessor 

      def initialize 
      end
    end
  end
end
