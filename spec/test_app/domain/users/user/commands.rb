Dir[File.dirname(__FILE__) + '/commands/*.rb'].each {|file| require_relative file }
module TestApp
  module Domain
    module Users
      class User
        module Commands
        end
      end
    end
  end
end