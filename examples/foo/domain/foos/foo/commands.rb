Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module FooBar
  module Foos
    class Foo
      module Commands
      end
    end
  end
end
