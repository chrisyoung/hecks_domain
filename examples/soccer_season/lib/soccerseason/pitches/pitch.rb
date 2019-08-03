require_relative 'pitch/factories'
require_relative 'pitch/repository'
require_relative 'pitch/commands'

module SoccerSeason
  module Pitches
    class Pitch
      include Helpers::FactoryLoader
      include Helpers::Repository
      include Helpers::CommandLoader

      attr_accessor :id, :name

      def initialize name:
        @name = name
      end
    end
  end
end
