class HecksDomain
  class DomainObject
    attr_reader :name, :aggregate

    def initialize(name, aggregate, &block)
      @name = name
      @aggregate = aggregate
      @operations = []
      @fields = []
      if is_a?(Entity)
        add_field(:id, IntegerField).tap { |field| field.optional = true }
      end
      instance_eval(&block)
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

    def list_accessors
      @fields.select { |field| field.is_a?(ListField) }
    end

    def public_accessors
      @fields.map do |field|
        field.public_accessor
      end.tap do |fields|
        fields << ':id' if is_a?(Entity)
      end.compact.join(', ')
    end

    def private_accessors
      @fields.map do |field|
        field.private_accessor
      end.compact.join(', ')
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

    def operations(list)
      @operations = list

      @operations = list.map do |name|
        Operation.new(name: name, domain_object: self)
      end
    end

    def operations_get
      @operations
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

    def binding
      super
    end

    private

    def add_field(name, type)
      type.new(name).tap { |field| @fields << field }
    end
  end
end
