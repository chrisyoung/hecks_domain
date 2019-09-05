module SoccerSeason
  module Domain
    module Matches
      class Match
        module Commands
          class AddGoal
            attr_reader :args, :head, :time, :player
            def initialize(match, args = {})
              @args = args
              @head = match
              @time = args[:time]
              @player = args[:player]
            end

            def call
              tap do |command|
                @head.instance_eval do
                  @goals << Goal.new(time: command.time, player: command.player)
                end
              end
            end
          end
        end
      end
    end
  end
end