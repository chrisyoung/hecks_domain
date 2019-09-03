require 'spec_helper'

describe SoccerSeason::Matches::Match do
  include_examples 'match'
  include_examples 'subscriber'
  subject { match }

  describe '.default' do
    SoccerSeason::Matches::Match.default(
      {
        fixture: {
          season: 'summer',
          date: Date.today,
          time: Time.now
        },
        teams: [{ name: 'redteam' }, { name: 'blueteam' }],
        pitch: { name: 'backyard' }
      }
    )
  end

  describe '#score' do
    context "Subscriber" do
      let(:subscriber) do
        Subscriber.new(
          SoccerSeason::Matches::Match::Commands::Score
        )
      end

      before do
        HecksDomain::Events::DomainEventPublisher.subscribe(subscriber)
      end

      it do
        expect(subscriber).to receive(:notify)
        subject.score!
      end
    end
  end
end