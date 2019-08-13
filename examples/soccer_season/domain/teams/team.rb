require_relative 'team/factories'
require_relative 'team/invariants'
require_relative 'team/repository'
require_relative 'team/commands'

module SoccerSeason
  module Teams
    class Team
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_reader :name, :id

      def initialize(name:)
        @name = name
      end

      private

      attr_writer :name, :id
    end
  end
end
