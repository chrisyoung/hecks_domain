
module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        class Repository
          include Singleton
          def self.save(object)
            instance.save(object)
          end

          def self.fetch(meeting)
            instance.fetch(meeting)
          end

          def initialize
            @objects = {}
          end

          def self.create(meeting)
            instance.create(meeting)
          end

          def create(meeting)
            klass = self.class.const_get(
              self.class.to_s.gsub('::Repository', '')
            )
            domain_object = klass.default(meeting)
            domain_object.test_invariants
            domain_object.tap(&:save)
          end

          def fetch(fetchable)
            return @objects[fetchable.id] if fetchable.respond_to?(:id)

            @objects[fetchable]
          end

          def save(meeting)
            domain_object = meeting
            domain_object.test_invariants
            @objects[meeting.hash] = domain_object

            meeting.instance_eval do
              @id = meeting.hash
            end

            meeting
          end
        end
      end
    end
  end
end
