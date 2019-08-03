module SoccerSeason
  module Matches
    class Match
      module Commands
        class Score
          def initialize(match)
            @match = match
          end

          def call
            grouped = @match.goals.group_by do |goal|
              goal.player.team
            end

            @match.result =
              if grouped[grouped.keys.first].count > grouped[grouped.keys.last].count
                Result.new(winner: grouped.keys.first, loser: grouped.keys.last)
              elsif grouped[grouped.keys.first].count < grouped[grouped.keys.last].count
                Result.new(loser: grouped.keys.first, winner: grouped.keys.last)
              else
                
                Result.new(loser: nil, winner: nil)
              end
          end
        end
      end
    end
  end
end