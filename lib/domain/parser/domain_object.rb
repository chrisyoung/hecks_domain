require_relative 'domain_object/factories'
class HecksDomain
  class Parser
    class DomainObject
      attr_accessor :ruby_file, :repository
      attr_reader :name, :factories

      def initialize(name, aggregate, &block)
        @name = name
        @aggregate = aggregate
        @repository = Repository.new
        @factories = Factories.new
        @fields = []
        @repository = Repository.new
        instance_eval &block
      end

      def optional(value)
        value.optional = true
      end

      def list(name)
        add_field(name, ListField)
      end

      def string(name)
        add_field(name, StringField)
      end

      def integer(name)
        add_field(name, IntegerField)
      end

      def currency(name)
        add_field(name, CurrencyField)
      end

      def value(name)
        add_field(name, ValueField)
      end

      def entity(name)
        add_field(name, EntityField)
      end

      def reference(name)
        add_field(name, ReferenceField)
      end

      def file_name
        folder_name + '.rb'
      end

      def folder_name
        @name.to_s.underscore
      end

      def get_binding
        binding
      end

      private

      def add_field(name, type)
        type.new(name).tap { |field| @fields << field }
      end
    end
  end
end
