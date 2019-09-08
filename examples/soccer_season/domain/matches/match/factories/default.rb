module SoccerSeason
  module Domain
    module Matches
      class Match
        module Factories
          class Default
            def self.factory(args)
              Match.new(
                id: args[:id],
                fixture: Fixture.new(args[:fixture]),
                teams: args[:teams].map do |team|
                  Teams::Team::Repository.fetch(
                    Teams::Team.default(team)
                  )
                end,
                pitch: Pitches::Pitch::Repository.fetch(
                  Pitches::Pitch.default(args[:pitch])
                )
              )
            end
          end
        end
      end
    end
  end
end
