require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Meetings::Meeting.default(
      allowed_votes: 5,
      timebox_extension: 1,
      topics: [],
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

  let(:lean_coffee_topic) do
    LeanCoffee::Topics::Topic.new(
      value: 'lean coffee', votes: 0, timebox: LeanCoffee::Topics::Timebox.zeroed
    )
  end

  let(:retrospective_topic) do
    LeanCoffee::Topics::Topic.new(
      value: 'retrospective', votes: 0, timebox: LeanCoffee::Topics::Timebox.zeroed
    )
  end

  it 'Example' do
    LeanCoffee::Meetings::Meeting.example
  end

  it 'Play a game' do
    expect { meeting.add_topic!(lean_coffee_topic) }
      .to raise_error 'Waiting to choose a phase'

    meeting.start_collecting!

    meeting.add_topic!(lean_coffee_topic)
    meeting.add_topic!(retrospective_topic)

    sleep(0.001)

    expect { meeting.add_topic!(lean_coffee_topic) }
      .to raise_error 'Waiting to choose a phase'

    expect(meeting.phase).to eq :waiting

    meeting.start_voting!

    meeting.vote!(topic: lean_coffee_topic, participant: chris)
    meeting.vote!(topic: retrospective_topic, participant: chris)
    meeting.vote!(topic: retrospective_topic, participant: chris)

    expect(lean_coffee_topic.votes).to eq 1
    expect(retrospective_topic.votes).to eq 2

    meeting.start_ordering!
    meeting.order_by_votes!

    expect(meeting.topics.first).to eq retrospective_topic

    meeting.move_topic_to_top!(lean_coffee_topic)
    expect(meeting.topics.first).to eq(lean_coffee_topic)
    meeting.move_topic_to_bottom!(lean_coffee_topic)
    expect(meeting.topics.first).to eq(retrospective_topic)

    meeting.start_discussing!
    expect(meeting.phase).to eq :discussing

    expect { meeting.vote!(topic: lean_coffee_topic, participant: chris) }
      .to raise_error 'In discussing phase. Valid Commands are: #discuss_next_topic'

    expect(meeting.discussing).to eq(retrospective_topic)
    expect(meeting.phase).to eq :discussing

    meeting.discuss_next_topic!
    expect(meeting.discussing).to eq(lean_coffee_topic)
  end
end
