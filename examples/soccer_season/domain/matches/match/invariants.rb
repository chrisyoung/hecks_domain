module SoccerSeason
  module Matches
    class Match
      module Invariants
        def test_invariants
          raise 'Must have two teams' unless @teams.count == 2
          raise 'Teams must be different' if @teams.first == @teams.last
        end
      end
    end
  end
end