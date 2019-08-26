require_relative 'meeting/factories'
require_relative 'meeting/invariants'
require_relative 'meeting/repository'
require_relative 'meeting/commands'
require_relative 'meeting/queries'

module LeanCoffee
  module Meetings
    class Meeting
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :timebox_extension, :phase, :discussion_list, :voting_timebox, :collection_timebox, :ordering_timebox, :discussing, :id

      def initialize(timebox_extension:, phase:, participants:, discussion_list:, voting_timebox:, collection_timebox:, ordering_timebox:, discussing: nil)
        @timebox_extension = timebox_extension
        @phase = phase
        @participants = participants
        @discussion_list = discussion_list
        @voting_timebox = voting_timebox
        @collection_timebox = collection_timebox
        @ordering_timebox = ordering_timebox
        @discussing = discussing
      end

      def participants
        @participants.clone.freeze
      end

      private

      attr_writer :timebox_extension, :phase, :participants, :discussion_list, :voting_timebox, :collection_timebox, :ordering_timebox, :discussing, :id
    end
  end
end
