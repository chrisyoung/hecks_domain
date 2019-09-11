
module SoccerSeason
  module Domain
    module Teams
      class Team
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(team)
            instance.fetch(team)
          end

          def initialize
            @objects = {}
          end

          def self.create(team)
            instance.create(team)
          end

          def create(team)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.default(team)
            domain_object.test_invariants
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(team)
            domain_object = team
            domain_object.test_invariants
            @objects[team.hash] = domain_object

            team.instance_eval do
              @id = team.hash
            end

            team
          end
        end
      end
    end
  end
end
