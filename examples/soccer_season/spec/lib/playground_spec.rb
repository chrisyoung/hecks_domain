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
    )
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
    )
  end

  let(:blueteam) do
    SoccerSeason::Teams::Team.new(
      name: 'blueteam'
    )
  end

  let(:pitch) do
    SoccerSeason::Pitches::Pitch.new(
      name: 'downtown'
    )
  end

  let(:player_chris) do
    SoccerSeason::Players::Player.new(name: 'chris', team: redteam)
  end

  let(:player_foster) do
    SoccerSeason::Players::Player.new(name: 'foster', team: redteam)
  end

  let(:player_clayton) do
    SoccerSeason::Players::Player.new(name: 'clayton', team: blueteam)
  end

  describe '#create' do
    before do
      [player_foster, player_chris, player_chris, player_clayton, player_clayton].each do |player|
        match.add_goal(Time.now, player)
      end
    end

    it 'saves the order' do
      match.score!
      expect(match.result.winner).to eq redteam
      match.add_goal(Time.now, player_clayton)
      match.score!
      expect(match.result.winner).to be_nil
      expect(match.result.tied?).to be true
    end
  end
end
