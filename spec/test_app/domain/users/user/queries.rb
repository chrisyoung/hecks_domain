Dir[File.dirname(__FILE__) + '/queries/*.rb'].each { |file| require_relative file }
module TestApp
  module Domain
    module Users
      class User
        module Queries
        end
      end
    end
  end
end