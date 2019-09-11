class Support
  module Repositories
    module RepositoryLoader
      def self.included(base)
        base.instance_eval do
          def create(domain_object)
            self::Repository.create(domain_object)
          end

          def save(domain_object)
            self::Repository.save(domain_object)
          end

          def fetch(fetchable)
            self::Repository.fetch(fetchable)
          end
        end
      end
    end
  end
end

