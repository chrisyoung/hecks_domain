require 'spec_helper'
require 'date'

describe "Playground" do
  include_examples 'subscriber'

  let(:match) do
    SoccerSeason::Matches::Match.new(
      fixture: fixture,
      teams: [redteam, blueteam],
      pitch: pitch,
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
    SoccerSeason::Teams::Team.new(name: 'redteam').tap(&:save)
  end

  let(:blueteam) do
    SoccerSeason::Teams::Team.new(name: 'blueteam').tap(&:save)
  end

  let(:pitch) do
    SoccerSeason::Pitches::Pitch.new(name: 'downtown').tap(&:save)
  end

  let(:chris) do
    SoccerSeason::Players::Player.new(name: 'chris', team: redteam).tap(&:save)
  end

  let(:foster) do
    SoccerSeason::Players::Player.new(name: 'foster', team: redteam).tap(&:save)
  end

  let(:clayton) do
    SoccerSeason::Players::Player.new(name: 'clayton', team: blueteam).tap(&:save)
  end

  describe 'Playground' do
    before do
      5.times do
        match.add_goal!(time: Time.now, player: foster)
      end

      4.times do
        match.add_goal!(time: Time.now, player: clayton)
      end
    end

    it 'Has a head' do
      expect(
        SoccerSeason::Pitches::Head.superclass
      ).to eq SoccerSeason::Pitches::Pitch
    end

    it 'Events' do
      # Events

      match.score!
      expect(match.result.winner).to eq (redteam)

      # I'm tired of calling score! every time I add a goal
      HecksDomain::Events.subscribe(ScoreOnAddGoal.new)
      3.times do
        match.add_goal!(time: Time.now, player: clayton)
      end
      expect(match.result.winner).to eq (blueteam)
    end

    it 'Winner!' do
      match.score!
      expect(match.result.winner).to eq redteam

      3.times do
        match.add_goal!(time: Time.now, player: clayton)
      end

      match.score!
      expect(match.result.winner).to eq blueteam
    end

    it 'Tied!' do
      match.add_goal!(time: Time.now, player: clayton)
      match.score!
      expect(match.result).to be_a(SoccerSeason::Matches::TiedResult)
    end

    it 'Invariants' do
      match.teams = [redteam, blueteam, SoccerSeason::Teams::Team.new(name: 'greenteam').tap(&:save)]
      expect { match.save }.to raise_error('Must have exactly two teams')
    end
  end
end
