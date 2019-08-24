Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module LeanCoffee
  module Meetings
    class Meeting
      module Factories
      end
    end
  end
  
end
