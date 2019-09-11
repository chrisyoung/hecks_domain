
module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(pitch)
            instance.fetch(pitch)
          end

          def initialize
            @objects = {}
          end

          def self.create(pitch)
            instance.create(pitch)
          end

          def create(pitch)
            self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            ).default(pitch).tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(pitch)
            @objects[pitch.hash] = pitch

            pitch.instance_eval do
              @id = pitch.hash
            end

            pitch
          end
        end
      end
    end
  end
end
