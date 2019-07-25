class Domain
  class Parser
    class DomainObject
      attr_accessor :ruby_file, :repository_file
      attr_reader :name
      
      def initialize(name, aggregate, &block)
        @name = name
        @aggregate = aggregate
        id = StringField.new(:id)
        id.optional = true
        @fields = [id]
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

      def repository_file_name
        folder_name + '_repository.rb'
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