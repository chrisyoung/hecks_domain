require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Meetings::Meeting.default(
      allowed_votes: 5,
      timebox_extension: 1,
      phase: :voting,
      discussion_list: LeanCoffee::Meetings::DiscussionList.new,
      time_boxes: { voting: 0, collection: 0, ordering: 0 },
      participants: [{ name: 'Angie' }, { name: 'Chris' }]
    )
  end

  let(:chris) do
    meeting.find_participant(name: 'Chris')
  end

  let(:angie) do
    let(:chris) do
      meeting.find_participant(name: 'Angie')
    end
  end

  let(:lean_coffee_discussion) {
    LeanCoffee::Discussions::Discussion.new(
      topic: 'lean coffee', votes: 0, timebox: 5
    )
  }

  let(:retrospective_discussion) {
    LeanCoffee::Discussions::Discussion.new(
      topic: 'retrospective', votes: 0, timebox: 5
    )
  }

  class TimeboxEndedSubscriber
    def initialize(foo_proc)
      @foo_proc = foo_proc
    end

    def domain_event
      LeanCoffee::Meetings::Meeting::Events::TimeboxEnded
    end
    def notify(event)
      @foo_proc.call
      puts '############ Call my URL please . . .'
    end
  end
  

  it 'Plays Nicely' do
    @poo = nil
    HecksDomain::Events::DomainEventPublisher.subscribe(
      TimeboxEndedSubscriber.new(
        Proc.new do
          @poo = 'bie'
        end
      )
    )
    meeting.start_meeting!

    sleep 0.01

    expect(@poo).to eq 'bie'

    meeting.add_discussion!(lean_coffee_discussion)
    meeting.add_discussion!(retrospective_discussion)

    meeting.start_voting!

    meeting.vote!(discussion: lean_coffee_discussion, participant: chris)
    meeting.vote!(discussion: retrospective_discussion, participant: chris)
    meeting.vote!(discussion: retrospective_discussion, participant: chris)

    expect(lean_coffee_discussion.votes).to eq 1
    expect(retrospective_discussion.votes).to eq 2

    meeting.start_ordering!
    meeting.order_by_votes!

    meeting.move_discussion_to_top!(lean_coffee_discussion)
    expect(meeting.discussion_list.positions.first.discussion).to eq(lean_coffee_discussion)
    meeting.move_discussion_to_bottom!(lean_coffee_discussion)
    expect(meeting.discussion_list.positions.first.discussion).to eq(retrospective_discussion)

    meeting.start_discussing!

    meeting.discuss_next_topic!
    expect(meeting.discussing).to eq(retrospective_discussion)
    meeting.discuss_next_topic!
    expect(meeting.discussing).to eq(lean_coffee_discussion)
  end
end
