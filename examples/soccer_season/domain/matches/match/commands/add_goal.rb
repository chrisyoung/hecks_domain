module SoccerSeason
  module Matches
    class Match
      module Commands
        class AddGoal
          attr_reader :args, :head
          def initialize(match, args={})
            require 'pry'; binding.pry
            @args = args
            @head = match
            @time = args[:time]
            @player = args[:player]
          end

          def call
            @head.goals << Goal.new(time: @time, player: @player)
            @head.save
          end
        end
      end
    end
  end
end