require_relative 'support'
Dir[File.dirname(__FILE__) + "/../events/*.rb"].each { |file| require_relative file }
require_relative '../domain/meetings/root'

module LeanCoffee
  class InvariantViolationError < StandardError; end
end
