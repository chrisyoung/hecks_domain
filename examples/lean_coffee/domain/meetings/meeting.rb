require_relative 'meeting/factories'
require_relative 'meeting/invariants'
require_relative 'meeting/repository'
require_relative 'meeting/commands'

module LeanCoffee
  module Meetings
    class Meeting
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_reader :allowed_votes, :timebox_extension, :phase, :discussion_list, :voting_timebox, :collection_timebox, :ordering_timebox, :id

      def initialize(allowed_votes:, timebox_extension:, phase:, participants:, discussion_list: nil, voting_timebox:, collection_timebox:, ordering_timebox:)
        @allowed_votes = allowed_votes
        @timebox_extension = timebox_extension
        @phase = phase
        @participants = participants
        @discussion_list = discussion_list
        @voting_timebox = voting_timebox
        @collection_timebox = collection_timebox
        @ordering_timebox = ordering_timebox
      end

      def participants
        @participants.clone.freeze
      end

      private

      attr_writer :allowed_votes, :timebox_extension, :phase, :participants, :discussion_list, :voting_timebox, :collection_timebox, :ordering_timebox, :id
    end
  end
end
