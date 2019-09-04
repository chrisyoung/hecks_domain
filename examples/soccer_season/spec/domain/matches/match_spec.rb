require 'spec_helper'

describe SoccerSeason::Domain::Matches::Match do
  include_examples 'match'
  include_examples 'subscriber'
  subject { match }
  let(:red_team) { SoccerSeason::Domain::Teams::Team.default(name: 'red_team').tap(&:save!) }
  let(:blue_team) { SoccerSeason::Domain::Teams::Team.default(name: 'blue_team').tap(&:save!) }

  describe '.default' do
    it do
      SoccerSeason::Domain::Matches::Match.default(
        {
          fixture: {
            season: 'summer',
            date: Date.today,
            time: Time.now
          },
          teams: [red_team, blue_team],
          pitch: { name: 'backyard' }
        }
      )
    end
  end

  describe '#score' do
    context "Subscriber" do
      let(:subscriber) do
        Subscriber.new(
          SoccerSeason::Domain::Matches::Match::Commands::Score
        )
      end

      before do
        Support::Events::DomainEventPublisher.subscribe(subscriber)
      end

      it do
        expect(subscriber).to receive(:notify)
        subject.score!
      end
    end
  end
end