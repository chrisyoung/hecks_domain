require_relative 'pitch/factories'
require_relative 'pitch/repository'

module SoccerSeason
  module Pitches
    class Pitch
      include Helpers::FactoryLoader
      include Helpers::Repository
      attr_reader :id, :name

      def initialize name:
        @name = name
      end
    end
  end
end
