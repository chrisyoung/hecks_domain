Dir[File.dirname(__FILE__) + '/queries/*.rb'].each { |file| require_relative file }
module LeanCoffee
  module Discussions
    class Discussion
      module Queries
      end
    end
  end
end

