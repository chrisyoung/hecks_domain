module SoccerSeason
  module Domain
    module Matches
      class Match
        module Factories
          class Default
            def self.factory(args)
              pitch = args[:pitch]
              Match.new(
                fixture: Fixture.new(args[:fixture]),
                teams: args[:teams].map { |team| Teams::Team::Repository.fetch(team.is_a?(Hash) ? team[:id] : team.id) },
                pitch: Pitches::Pitch::Repository.fetch(pitch.is_a?(Hash) ? pitch[:id] : pitch.id)
              )
            end
          end
        end
      end
    end
  end
end