require 'spec_helper'
require 'date'

describe "Playground" do
  include_examples 'subscriber'

  let(:match) do
    SoccerSeason::Matches::Match.new(
      fixture: fixture,
      teams: [@redteam, @blueteam],
      pitch: @pitch
    ).tap(&:save!)
  end

  let(:fixture) do
    SoccerSeason::Matches::Fixture.new(
      season: 2012,
      date: Date.today,
      time: Time.now
    )
  end

  before do
    @pitch = SoccerSeason::Pitches::Pitch.new(name: 'downtown').tap(&:save!)

    # Red Team
    @redteam = SoccerSeason::Teams::Team.new(name: 'redteam').tap(&:save!)
    @chris = SoccerSeason::Players::Player.new(name: 'chris', team: @redteam).tap(&:save!)
    @foster = SoccerSeason::Players::Player.new(name: 'foster', team: @redteam).tap(&:save!)

    # Blue Team
    @blueteam = SoccerSeason::Teams::Team.new(name: 'blueteam').tap(&:save!)
    @greenteam = SoccerSeason::Teams::Team.new(name: 'greenteam').tap(&:save!)
    @clayton = SoccerSeason::Players::Player.new(name: 'clayton', team: @blueteam).tap(&:save!)

    5.times { match.add_goal!(time: Time.now, player: @foster) }
    4.times { match.add_goal!(time: Time.now, player: @clayton) }
  end

  it 'Has a head' do
    expect(
      SoccerSeason::Pitches::Head.superclass
    ).to eq SoccerSeason::Pitches::Pitch
  end

  it 'Events' do
    # Events

    match.score!
    expect(match.result.winner).to eq @redteam

    # I'm tired of calling `#score!` every time I add a goal
    subscriber = ScoreOnAddGoal.new
    HecksDomain::Events.subscribe(subscriber)
    3.times do
      match.add_goal!(time: Time.now, player: @clayton)
    end
    expect(match.result.winner).to eq(@blueteam)
    HecksDomain::Events.cancel_subscription(subscriber)
  end

  it 'Winner!' do
    match.score!
    expect(match.result.winner).to eq @redteam

    3.times do
      match.add_goal!(time: Time.now, player: @clayton)
    end

    match.score!
    expect(match.result.winner).to eq @blueteam
  end

  it 'Tied!' do
    match.add_goal!(time: Time.now, player: @clayton)
    match.score!
    expect(match.result).to be_a(SoccerSeason::Matches::TiedResult)
  end

  it 'blows up if you try to use the accessor to update lists' do
    expect { match.teams << @greenteam }.to raise_error('can\'t modify frozen Array')
  end

  it 'Invariants' do
    expect { match.set_teams!([@redteam, @blueteam, @greenteam]) }.to raise_error('Must have exactly two teams')
    expect { match.set_teams!([@redteam, @redteam]) }.to raise_error('Teams must be different')
  end
end
