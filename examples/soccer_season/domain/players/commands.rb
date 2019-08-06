Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }

module SoccerSeason
  module Players
    module Commands
    end
  end
end
