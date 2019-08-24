Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module LeanCoffee
  module Meetings
    class Meeting
      module Invariants
      end
    end
  end
end
