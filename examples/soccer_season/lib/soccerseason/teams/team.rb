require_relative 'team/factories'
require_relative 'team/repository'
require_relative 'team/commands'

module SoccerSeason
  module Teams
    class Team
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
