module SoccerSeason
  module Domain
    module Matches
      class Match
        module Invariants
          module Basic
            def invariant_two_teams(command)
              raise 'Must have exactly two teams' unless @teams.count == 2
            end

            def invariant_different_teams(command)
              raise 'Teams must be different' if @teams.uniq.count == 1
            end
          end
        end
      end
    end
  end
end
