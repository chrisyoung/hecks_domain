require 'spec_helper'

describe 'Playground' do
  it do
    LeanCoffee::Meetings::Meeting.new(
      allowed_votes: 6,
      timebox_extension: 1,
      phase: :voting,
      voting_timebox: LeanCoffee::Meetings::Timebox.new(
        duration: 3
      ),
      collection_timebox: LeanCoffee::Meetings::Timebox.new(
        duration: 3
      ),
      ordering_timebox: LeanCoffee::Meetings::Timebox.new(
        duration: 3
      ),
      participants: [
        LeanCoffee::Meetings::Participant.new(
          name: 'Angie',
          remaining_votes: 5
        ),
        LeanCoffee::Meetings::Participant.new(
          name: 'Chris',
          remaining_votes: 5,
        )
      ]
    )
  end
end