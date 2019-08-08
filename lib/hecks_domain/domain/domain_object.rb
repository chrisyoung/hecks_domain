require_relative 'domain_object/factories'
require_relative 'domain_object/commands'
require_relative 'domain_object/invariants'

class HecksDomain
  class DomainObject
    attr_accessor :ruby_file, :repository
    attr_reader :name, :factories

    def initialize(name, aggregate, &block)
      @name = name
      @aggregate = aggregate
      @repository = Repository.new
      @factories = Factories.new
      @commands = Commands.new
      @invariants = Invariants.new
      @fields = []
      @repository = Repository.new
      instance_eval &block
    end

    def optional(value)
      value.optional = true
    end

    def initializer_attributes
      @fields.reject(&:read_only?).map(&:attribute_name).join(', ')
    end

    def invariants
      @invariants
    end

    def boolean_accessors
      @fields.select { |field| field.is_a?(BooleanField) }
    end

    def accessors
      @fields.map do |field|
        ":#{field.name}"
      end.tap do |fields| 
        fields << ':id' if is_a?(Entity) 
      end.join(', ')
    end

    def commands
      @commands
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

    def boolean(name)
      add_field(name, BooleanField)
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

    def read_only(value)
      value.read_only = true
      value
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
