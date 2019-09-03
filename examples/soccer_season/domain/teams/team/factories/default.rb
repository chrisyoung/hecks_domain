module SoccerSeason
  module Teams
    class Team
      module Factories
        class Default
          def self.factory(args)
            Team.new(args)
          end
        end
      end
    end
  end
end