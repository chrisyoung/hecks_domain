require_relative 'hecks_domain'
Dir[File.dirname(__FILE__) + "/../events/*.rb"].each { |file| require_relative file }
require_relative '../domain/matches/head'
require_relative '../domain/teams/head'
require_relative '../domain/players/head'
require_relative '../domain/pitches/head'

module SoccerSeason
end
