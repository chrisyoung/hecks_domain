Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module FooBar
  module Foos
    class Foo
      module Factories
      end
    end
  end
  
end
