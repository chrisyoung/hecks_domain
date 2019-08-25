Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module LeanCoffee
  module Discussions
    class Discussion
      module Commands
      end
    end
  end
end
