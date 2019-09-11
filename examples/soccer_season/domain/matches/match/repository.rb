
module SoccerSeason
  module Domain
    module Matches
      class Match
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(match)
            instance.fetch(match)
          end

          def initialize
            @objects = {}
          end

          def self.create(match)
            instance.create(match)
          end

          def create(match)
            self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            ).default(match).tap(&:save!)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)
            @objects[fetchable]
          end

          def save(match)
            @objects[match.hash] = match

            match.instance_eval do
              @id = match.hash
            end
            
            match
          end
        end
      end
    end
  end
end
