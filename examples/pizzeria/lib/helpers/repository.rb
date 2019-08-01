module Pizzeria
  module Helpers
    module Repository
      def save
        @id = self.class.repository.save(self)
      end

      module ClassMethods
        def repository
          self::Repository
        end

        def fetch(id)
          repository.fetch(id)
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end
    end
  end
end
