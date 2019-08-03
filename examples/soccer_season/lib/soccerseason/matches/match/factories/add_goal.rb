module SoccerSeason
  module Matches
    class Match
      module Factories
        class AddGoal
          def self.factory(match, time, player)
            match.goals << Goal.new(time: time, player: player)
          end
        end
      end
    end
  end
end