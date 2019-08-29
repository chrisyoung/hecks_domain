['services', 'commands', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/meeting/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'meeting/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/meeting/#{name}/*.rb"].each { |file| require_relative file }
end


module LeanCoffee
  module Meetings
    class Meeting
      include HecksDomain::Factories::FactoryLoader
      
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :timebox_extension, :phase, :discussion, :timebox, :id

      def initialize(timebox_extension:, phase: nil, participants:, discussion:, timebox:)
        @timebox_extension = timebox_extension
        @phase = phase
        @participants = participants
        @discussion = discussion
        @timebox = timebox
      end

      def participants
        @participants.clone.freeze
      end

      private

      attr_writer :timebox_extension, :phase, :participants, :discussion, :timebox, :id
    end
  end
end
