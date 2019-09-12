class Support
  module Repositories
    module RepositoryLoader
      def self.included(base)
        base.class_eval do
          def save
            test_invariants
            self.class::Repository.save(self)
          end
        end

        base.instance_eval do
          def create(domain_object = nil)
            test_invariants
            self::Repository.create(domain_object)
          end

          def fetch(fetchable)
            self::Repository.fetch(fetchable)
          end
        end
      end
    end
  end
end
