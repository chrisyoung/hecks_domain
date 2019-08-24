Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module FooBar
  module Foos
    class Bar
      module Invariants
      end
    end
  end
end
