require 'spec_helper'

describe 'Playground' do
  let(:angie) do
    LeanCoffee::Meetings::Participant.new(
      name: 'Angie',
      remaining_votes: 5
    )
  end

  let(:chris) do
    LeanCoffee::Meetings::Participant.new(
      name: 'Chris',
      remaining_votes: 5
    )
  end

  let(:meeting) do
    LeanCoffee::Meetings::Meeting.default(
      allowed_votes: 5,
      timebox_extension: 1,
      phase: :voting,
      discussion_list: LeanCoffee::Meetings::DiscussionList.new,
      time_boxes: { voting: 3, collection: 3, ordering: 3 },
      participants: [angie, chris]
    )
  end

  it do
    meeting.add_discussion!(topic: 'lean coffee')
    meeting.add_discussion!(topic: 'retrospective')
    meeting.vote!(topic: 'lean coffee', participant: chris)
    expect(chris.remaining_votes).to eq 4
  end
end