module SoccerSeason
  module Matches
    class Match
      module Commands
        class AddGoal
          attr_reader :args, :head
          def initialize(match, args={})
            @match = match
            @args = args
            @head = match
            @time = args[:time]
            @player = args[:player]
          end

          def call
            goal = Goal.new(time: @time, player: @player)
            @match.goals << Goal.new(time: @time, player: @player)
            @player.team.goals << goal
            @match.save
          end
        end
      end
    end
  end
end