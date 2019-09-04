module SoccerSeason
  module Domain
    module Players
      class Player
        module Factories
          class Default
            def self.factory(args)
              Player.new(
                team: Teams::Team::Repository.fetch(args[:team].is_a?(Hash) ? args[:team][:id] : args[:team].id),
                name: args[:name]
              )
            end
          end
        end
      end
    end
  end
end