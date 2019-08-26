Dir[File.dirname(__FILE__) + '/events/*.rb'].each { |file| require_relative file }
module LeanCoffee
  module Discussions
    class Discussion
      module Events
      end
    end
  end
end

