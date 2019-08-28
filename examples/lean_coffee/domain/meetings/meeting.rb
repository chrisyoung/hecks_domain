['services', 'commands', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/meeting/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'meeting/repository'

module LeanCoffee
  module Meetings
    class Meeting
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :timebox_extension, :phase, :voting_timebox, :collection_timebox, :ordering_timebox, :discussing, :id

      def initialize(timebox_extension:, phase: nil, participants:, discussed: [], discussions:, voting_timebox:, collection_timebox:, ordering_timebox:, discussing: nil)
        @timebox_extension = timebox_extension
        @phase = phase
        @participants = participants
        @discussed = discussed
        @discussions = discussions
        @voting_timebox = voting_timebox
        @collection_timebox = collection_timebox
        @ordering_timebox = ordering_timebox
        @discussing = discussing
      end

      def participants
        @participants.clone.freeze
      end

      def discussed
        @discussed.clone.freeze
      end

      def discussions
        @discussions.clone.freeze
      end

      private

      attr_writer :timebox_extension, :phase, :participants, :discussed, :discussions, :voting_timebox, :collection_timebox, :ordering_timebox, :discussing, :id
    end
  end
end
