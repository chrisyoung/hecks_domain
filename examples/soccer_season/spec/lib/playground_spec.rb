require 'spec_helper'
require 'date'

describe "Playground" do
  let(:match) do
    SoccerSeason::Matches::Match.new(
      fixture: fixture,
      teams: [redteam, blueteam],
      pitch: pitch,
      goals: [],
      result: nil
    ).tap(&:save)
  end

  let(:fixture) do
    SoccerSeason::Matches::Fixture.new(
      season: 2012,
      date: Date.today,
      time: Time.now
    )
  end

  let(:redteam) do
    SoccerSeason::Teams::Team.new(
      name: 'redteam'
    ).tap(&:save)
  end

  let(:blueteam) do
    SoccerSeason::Teams::Team.new(
      name: 'blueteam'
    ).tap(&:save)
  end

  let(:pitch) do
    SoccerSeason::Pitches::Pitch.new(
      name: 'downtown'
    ).tap(&:save)
  end

  let(:player_chris) do
    SoccerSeason::Players::Player.new(name: 'chris', team: redteam).tap(&:save)
  end

  let(:player_foster) do
    SoccerSeason::Players::Player.new(name: 'foster', team: redteam).tap(&:save)
  end

  let(:player_clayton) do
    SoccerSeason::Players::Player.new(name: 'clayton', team: blueteam).tap(&:save)
  end

  describe '#create' do
    before do
      [player_foster, player_chris, player_chris, player_clayton, player_clayton].each do |player|
        match.add_goal!(time: Time.now, player: player)
      end
    end

    class Logger
      def self.log(event)
        [
          "\tEVENT FIRED!",
          "\tevent name: " + event.name,
          "\thead_id:" + event.head.id.to_s,
          "\targs: " + event.args.to_s,
          "\thead: " + event.command.head.inspect,
        ].each { |value| puts value }
      end
    end
    class Subscriber
      def self.event_name
        '*'
      end

      def self.notify(event)
        Logger.log(event)
      end
    end

    it 'saves the order' do
      HecksDomain::Events::DomainEventPublisher.subscribe(Subscriber)
      
      match.score! do |event|
        Logger.log(event)
      end

      expect(match.result.winner).to eq redteam
      match.add_goal!(time: Time.now, player: player_clayton)
      match.score!

      require 'pry'
      binding.pry
      SoccerSeason::Pitches::Head
      expect(match.result.winner).to be_nil
      expect(match.result.tied?).to be true

            

    end
  end
end
