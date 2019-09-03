module SoccerSeason
  module Matches
    class Match
      module Factories
        class Default
          def self.factory(args)
            Match.new(
              fixture: Fixture.new(args[:fixture]),
              teams: args[:teams].map { |team| Teams::Team.new(team) },
              pitch: Pitches::Pitch.new(args[:pitch])
            )
          end
        end
      end
    end
  end
end