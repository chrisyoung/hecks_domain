Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }

module SoccerSeason
  module Teams
    module Commands
    end
  end
end
