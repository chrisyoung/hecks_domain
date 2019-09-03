module SoccerSeason
  module Players
    class Player
      module Factories
        class Default
          def self.factory(args)
            Player.new(
              team: Teams::Team.new(args[:team]),
              name: args[:name]
            )
          end
        end
      end
    end
  end
end