require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Meetings::Meeting.default(
      allowed_votes: 5,
      timebox_extension: 1,
      discussion_list: LeanCoffee::Meetings::DiscussionList.new,
      time_boxes: { voting: 0, collection: 0, ordering: 0 },
      participants: [{ name: 'Angie' }, { name: 'Chris' }]
    )
  end

  let(:chris) do
    meeting.find_participant(name: 'Chris')
  end

  let(:angie) do
    let(:chris) { meeting.find_participant(name: 'Angie') }
  end

  let(:lean_coffee_discussion) do
    LeanCoffee::Discussions::Discussion.new(
      topic: 'lean coffee', votes: 0, timebox: 5
    )
  end

  let(:retrospective_discussion) do
    LeanCoffee::Discussions::Discussion.new(
      topic: 'retrospective', votes: 0, timebox: 5
    )
  end

  it 'Example' do
    LeanCoffee::Meetings::Meeting.example(voting: 0, collection: 0, ordering: 0)
  end

  it 'Play a game' do
    expect { meeting.add_discussion!(lean_coffee_discussion) }
      .to raise_error 'Waiting to choose a phase'

    meeting.start_collecting!

    meeting.add_discussion!(lean_coffee_discussion)
    meeting.add_discussion!(retrospective_discussion)

    sleep(0.001)

    expect { meeting.add_discussion!(lean_coffee_discussion) }
      .to raise_error 'Waiting to choose a phase'

    expect(meeting.phase).to eq :waiting

    meeting.start_voting!

    meeting.vote!(discussion: lean_coffee_discussion, participant: chris)
    meeting.vote!(discussion: retrospective_discussion, participant: chris)
    meeting.vote!(discussion: retrospective_discussion, participant: chris)

    expect(lean_coffee_discussion.votes).to eq 1
    expect(retrospective_discussion.votes).to eq 2

    meeting.start_ordering!
    meeting.order_by_votes!

    expect(meeting.discussion_list.positions.first.discussion).to eq retrospective_discussion

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
