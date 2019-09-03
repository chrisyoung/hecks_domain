require 'spec_helper'

describe SoccerSeason::Pitches::Pitch do
  subject { match }

  describe '.default' do
    SoccerSeason::Pitches::Pitch.default(name: 'home')
  end
end