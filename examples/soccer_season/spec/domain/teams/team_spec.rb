require 'spec_helper'

describe SoccerSeason::Teams::Team do
  subject { match }

  describe '.default' do
    SoccerSeason::Teams::Team.default(name: 'redteam')
  end
end