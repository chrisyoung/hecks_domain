Dir[File.dirname(__FILE__) + '/invariants/*.rb'].each {|file| require_relative file }

module FooBar
  module Foos
    class Foo
      module Invariants
      end
    end
  end
end
