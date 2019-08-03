module SoccerSeason
  module Matches
    class Match
      class Repository
        include Singleton
        def self.save(object)
          instance.save(object)
        end

        def self.fetch(id)
          instance.fetch(id)
        end

        def initialize
          @objects = {}
        end

        def fetch(id)
          @objects[id]
        end

        def save(object)
          object.hash.tap do |hash|
            @objects[hash] = object
          end
        end
      end
    end
  end
end

