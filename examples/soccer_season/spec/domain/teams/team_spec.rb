require 'spec_helper'

describe SoccerSeason::Domain::Teams::Team do
  subject { match }

  describe '.default' do
    SoccerSeason::Domain::Teams::Team.default(name: 'redteam')
  end
end