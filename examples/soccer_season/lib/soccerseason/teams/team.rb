require_relative 'team/factories'
require_relative 'team/repository'

module SoccerSeason
  module Teams
    class Team
      include Helpers::FactoryLoader
      include Helpers::Repository
      attr_reader :id, :name

      def initialize name:
        @name = name
      end
    end
  end
end
