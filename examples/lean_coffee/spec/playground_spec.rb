require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Domain::Meetings::Meeting.default(
      allowed_votes: 5,
      timebox_extension: 1,
      discussion: LeanCoffee::Domain::Meetings::Discussion.default,
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
      lean_coffee: LeanCoffee::Domain::Meetings::Topic.default(
        value: 'lean coffee', timebox: LeanCoffee::Domain::Meetings::Timebox.zeroed
      ),
      retrospective: LeanCoffee::Domain::Meetings::Topic.default(
        value: 'retrospective', timebox: LeanCoffee::Domain::Meetings::Timebox.zeroed
      )
    }
  }

  it 'Example' do
    LeanCoffee::Domain::Meetings::Meeting.example
  end

  it 'Play a game' do
    # Collecting #######################

    meeting.start_collecting!
    meeting.add_topic!(topics[:lean_coffee])
    meeting.add_topic!(topics[:retrospective])
    sleep(0.001)

    expect { meeting.add_topic!(topics[:lean_coffee]) }
      .to raise_error 'In waiting phase.'
    expect(meeting.phase).to eq :waiting

    # Voting for Topics #######################

    meeting.start_voting!

    expect(meeting.phase).to eq :voting

    meeting.vote!(topic: topics[:lean_coffee], participant: chris)
    meeting.vote!(topic: topics[:retrospective], participant: chris)
    meeting.vote!(topic: topics[:retrospective], participant: chris)

    expect(topics[:lean_coffee].votes).to eq 1
    expect(topics[:retrospective].votes).to eq 2

    # Ordering #######################

    meeting.start_ordering!

    expect(meeting.phase).to eq :ordering

    meeting.order_by_votes!

    expect(meeting.discussion.topics.first).to eq topics[:retrospective]

    meeting.move_topic_to_top!(topics[:lean_coffee])

    expect(meeting.discussion.topics.first).to eq(topics[:lean_coffee])

    meeting.move_topic_to_bottom!(topics[:lean_coffee])

    expect(meeting.discussion.topics.first).to eq(topics[:retrospective])

    # Discussing #######################

    meeting.start_discussing!

    expect(meeting.phase).to eq :discussing

    meeting.discuss_next_topic!

    expect(meeting.discussion.discussing).to eq(topics[:retrospective])
    expect(meeting.phase).to eq :discussing_topic
    expect { meeting.vote!(topic: topics[:lean_coffee], participant: chris) }
      .to raise_error 'In discussing_topic phase.'

    sleep(0.001)

    expect(meeting.phase).to eq :waiting_for_extension_vote

    meeting.discuss_next_topic!
    
    expect(meeting.discussion.discussing).to eq(topics[:lean_coffee])

    sleep(0.001)

    # Keep Talking #######################

    expect(meeting.phase).to eq(:waiting_for_extension_vote)

    meeting.vote_to_keep_talking!(participant: angie)
    meeting.vote_to_stop_talking!(participant: chris)

    # expect { meeting.vote_to_keep_talking!(participant: angie) }.to raise_error('Angie voted for the same topic twice!')

    meeting.keep_talking!

    expect { meeting.discuss_next_topic! }.to raise_error "In discussing_topic phase."

    sleep(0.001)

    # Stop Talking #######################
    expect(meeting.phase).to eq :waiting_for_extension_vote

    meeting.vote_to_stop_talking!(participant: chris)
    meeting.vote_to_stop_talking!(participant: angie)
    meeting.discuss_next_topic!

    meeting.save
  end
end
