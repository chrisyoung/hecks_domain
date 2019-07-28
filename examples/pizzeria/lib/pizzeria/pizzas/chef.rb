  require_relative 'chef/repository'

module Pizzeria
  module Pizzas
    class Chef
      attr_reader :id, :name

      def initialize id: nil, name:
        @id = id
        @name = ChefName.new(name)
      end
      
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end

      def self.fetch(id)
        repository.fetch(id)
      end

      def save
        @id = self.class.repository.save(self)
      end

      def self.repository
        Repository
      end
    end
  end
end
