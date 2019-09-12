module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        include Support::Root
        include Support::DomainObject

        attr_reader :id, :timebox_extension, :phase, :discussion, :timebox, :id

        def initialize(id: nil, timebox_extension:, phase: nil, participants:, discussion:, timebox:)
          @id = id
          @phase = phase
          @participants = participants
          @discussion = discussion
          @timebox = timebox
        end

        def participants
          @participants.clone.freeze
        end

        private

        attr_writer :id, :timebox_extension, :phase, :participants, :discussion, :timebox
      end
    end
  end
end
