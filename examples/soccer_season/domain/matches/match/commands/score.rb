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
            @match.result = result
            @match.save
            self
          end

          private

          def get_count(team)
            @goals.count { |goal| goal.player.team == team }
          end

          def result
            counts = @teams.map { |team| get_count(team) }

            return TiedResult.new if counts.first == counts.last
            return Result.new(winner: @teams.first, loser: @teams.last) if counts.first > counts.last

            Result.new(winner: @teams.last, loser: @teams.first)
          end
        end
      end
    end
  end
end
