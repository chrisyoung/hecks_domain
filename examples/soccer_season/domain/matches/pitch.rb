require_relative 'pitch/factories'
require_relative 'pitch/invariants'

module SoccerSeason
  module Matches
    class Pitch
      include HecksDomain::Factories::FactoryLoader
      include Invariants
      
      

      attr_accessor :name

      def initialize name:
        @name = name
      end
    end
  end
end
