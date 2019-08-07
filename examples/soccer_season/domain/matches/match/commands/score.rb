module SoccerSeason
  module Matches
    class Match
      module Commands
        class Score
          attr_reader :args, :head

          def initialize(match, *args)
            @head = @match = match
            @args = args
            @teams = match.teams
          end

          def call
            order_teams_by_goals
            @match.result = set_result
            @match.save
            self
          end

          private

          def order_teams_by_goals
            @teams.sort! { |team| team.goals.count }.reverse!
          end

          def set_result
            return TiedResult.new if tied?

            Result.new(
              winner: @teams.first,
              loser: @teams.last
            )
          end

          def tied?
            @teams.map { |team| team.goals.count }.uniq.count == 1
          end
        end
      end
    end
  end
end
