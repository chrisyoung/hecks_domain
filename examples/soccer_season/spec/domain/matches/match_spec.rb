require 'spec_helper'

describe SoccerSeason::Matches::Match do
  include_examples 'match'
  include_examples 'subscriber'
  subject { match }

  describe '#score' do
    context "Subscriber" do
      let(:subscriber) { Subscriber.new(SoccerSeason::Matches::Match::Commands::Score) }
      before do
        HecksDomain::Events::DomainEventPublisher.subscribe(subscriber)
      end

      it do
        expect(subscriber).to receive(:notify)
        subject.score!
      end
    end

    it do
      subject.score! do |event|
        expect(event).to be_a(HecksDomain::Events::DomainEvent)
        expect(event.command).to be_a(SoccerSeason::Matches::Match::Commands::Score)
      end
    end
  end
end