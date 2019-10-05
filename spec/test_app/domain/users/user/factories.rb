Dir[File.dirname(__FILE__) + '/factories/*.rb'].each {|file| require_relative file }
module TestApp
  module Domain
    module Users
      class User
        module Factories
        end
      end
    end
  end
  end