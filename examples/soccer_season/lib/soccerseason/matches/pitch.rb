require_relative 'pitch/factories'

module SoccerSeason
  module Matches
    class Pitch
      include Helpers::FactoryLoader
      
      

      attr_accessor :name

      def initialize name:
        @name = name
      end
    end
  end
end
