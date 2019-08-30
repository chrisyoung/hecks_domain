require_relative 'hecks_domain'
Dir[File.dirname(__FILE__) + "/../events/*.rb"].each { |file| require_relative file }
require_relative '../domain/meetings/head'
require_relative '../domain/discussions/head'
require_relative '../domain/topics/head'

module LeanCoffee
end
