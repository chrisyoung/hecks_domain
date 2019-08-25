require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Meetings::Meeting.default(
      allowed_votes: 6,
      timebox_extension: 1,
      phase: :voting,
      time_boxes: {
        voting: 3,
        collection: 3,
        ordering: 3
      },
      participants: [
        LeanCoffee::Meetings::Participant.new(
          name: 'Angie',
          remaining_votes: 5
        ),
        LeanCoffee::Meetings::Participant.new(
          name: 'Chris',
          remaining_votes: 5
        )
      ]
    )
  end
  
  it do
    meeting
  end
end