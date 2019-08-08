module SoccerSeason
  module Matches
    class Match
      module Commands
        class Score
          attr_reader :args, :head

          def initialize(match)
            @head = @match = match
            @teams = match.teams
            @goals = match.goals
          end

          def call
            fetch_team_goals
            order_teams_by_goals
            @match.result = set_result
            @match.save
            self
          end

          private

          def fetch_team_goals
            @team_goals = @goals.map { |goal| goal.player.team }
          end

          def order_teams_by_goals
            @ordered_teams =
              @teams.sort { |team| @team_goals.count(team) }.reverse!
          end

          def set_result
            return TiedResult.new if tied?

            Result.new(winner: @ordered_teams.first, loser: @ordered_teams.last)
          end

          def tied?
            @team_goals.map { |team| @team_goals.count(team) }.uniq.count == 1
          end
        end
      end
    end
  end
end
