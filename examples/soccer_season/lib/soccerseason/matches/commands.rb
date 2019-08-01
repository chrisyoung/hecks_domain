Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }

module SoccerSeason
  module Matches
    module Commands
    end
  end
end
