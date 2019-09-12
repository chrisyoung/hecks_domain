require_relative 'meeting'
require_relative 'discussion'
require_relative 'timebox'
require_relative 'participant'
require_relative 'topic'
require_relative 'topic_timebox'
require_relative 'extension'

module LeanCoffee
  module Domain
    module Meetings
      class Root < Meeting
      end
    end
  end
end

