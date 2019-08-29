require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Meetings::Meeting.default(
      allowed_votes: 5,
      timebox_extension: 1,
      discussion: LeanCoffee::Discussions::Discussion.default,
      time_boxes: { voting: 0, collection: 0, ordering: 0 },
      participants: [{ name: 'Angie' }, { name: 'Chris' }]
    )
  end

  let(:chris) do
    meeting.find_participant(name: 'Chris')
  end

  let(:angie) do
    meeting.find_participant(name: 'Angie')
  end

  let(:topics) {
    {
      lean_coffee: LeanCoffee::Topics::Topic.default(
        value: 'lean coffee', timebox: LeanCoffee::Topics::Timebox.zeroed
      ),
      retrospective: LeanCoffee::Topics::Topic.default(
        value: 'retrospective', timebox: LeanCoffee::Topics::Timebox.zeroed
      )
    }
  }

  it 'Example' do
    LeanCoffee::Meetings::Meeting.example
  end

  it 'Play a game' do      
    # Collecting

    meeting.start_collecting!

    meeting.add_topic!(topics[:lean_coffee])
    meeting.add_topic!(topics[:retrospective])

    sleep(0.001)

    expect { meeting.add_topic!(topics[:lean_coffee]) }
      .to raise_error 'Waiting to choose a phase'

    expect(meeting.phase).to eq :waiting

    # Voting for Topics

    meeting.start_voting!

    meeting.vote!(topic: topics[:lean_coffee], participant: chris)
    meeting.vote!(topic: topics[:retrospective], participant: chris)
    meeting.vote!(topic: topics[:retrospective], participant: chris)

    expect(topics[:lean_coffee].votes).to eq 1
    expect(topics[:retrospective].votes).to eq 2

    # Ordering

    meeting.start_ordering!
    meeting.order_by_votes!

    expect(meeting.discussion.topics.first).to eq topics[:retrospective]

    meeting.move_topic_to_top!(topics[:lean_coffee])
    expect(meeting.discussion.topics.first).to eq(topics[:lean_coffee])
    meeting.move_topic_to_bottom!(topics[:lean_coffee])
    expect(meeting.discussion.topics.first).to eq(topics[:retrospective])


    # Discussing

    meeting.start_discussing!
    meeting.discuss_next_topic!

    expect(meeting.phase).to eq :discussing

    expect { meeting.vote!(topic: topics[:lean_coffee], participant: chris) }
      .to raise_error 'In discussing phase. Valid Commands are: #discuss_next_topic'

    expect(meeting.discussion.discussing).to eq(topics[:retrospective])
    expect(meeting.phase).to eq :discussing

    meeting.discuss_next_topic!
    expect(meeting.discussion.discussing).to eq(topics[:lean_coffee])

    sleep(0.001)

    # Keep Talking

    expect(meeting.phase).to eq(:waiting_for_extension_vote)
    meeting.vote_to_keep_talking!(participant: angie)
    meeting.vote_to_stop_talking!(participant: chris)

    expect { meeting.vote_to_keep_talking!(participant: angie) }.to raise_error

    meeting.keep_talking!
    expect { meeting.discuss_next_topic! }.to raise_error

    sleep(0.001)

    # Stop Talking
    meeting.vote_to_stop_talking!(participant: chris)
    meeting.vote_to_stop_talking!(participant: angie)
    meeting.discuss_next_topic!
  end
end
