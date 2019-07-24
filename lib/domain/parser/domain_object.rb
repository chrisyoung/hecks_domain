class Domain
  class Parser
    class DomainObject
      attr_accessor :ruby_file
      attr_reader :name
      
      def initialize(name, aggregate, &block)
        @name = name
        @value_objects = []
        @entities = []
        @lists = []
        @aggregate = aggregate
        instance_eval &block
        @fields = @lists + @entities + @value_objects
      end

      def list(name)
        ListField.new(name).tap { |list| @lists << list }
      end

      def optional(value)
        value.optional = true
      end
    
      def string(name, options={})
        StringField.new(name, options).tap do |field|
          @value_objects << field
        end
      end
    
      def integer(name)
        @value_objects << IntegerField.new(name)
      end
      
      def currency(name)
        @value_objects << CurrencyField.new(name)
      end
    
      def value(name)
        ValueField.new(name).tap do |field|
          @value_objects << field
        end
      end

      def entity(name)
        EntityField.new(name).tap { |entity| @entities << entity }
      end

      def reference(name)
        ReferenceField.new(name).tap { |entity| @entities << entity }
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
    end
    
  end
end