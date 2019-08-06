class HecksDomain
  class Aggregate  
    attr_reader :domain, :name, :domain_objects
    attr_accessor :ruby_file, :head_file
    
    def initialize(name, domain, &block)
      @name = name
      @entities = []
      @value_objects = []
      @head_file = HeadFile.new
      @domain = domain
      instance_eval &block
      @domain_objects = @entities + @value_objects
    end

    def entity(name, &block)
      Entity.new(name, self, &block).tap do |entity|
        @entities << entity
      end
    end

    def file_name
      folder_name + '.rb'
    end

    def head_file
      @head_file
    end

    def folder_name
      name.to_s.underscore
    end

    def head(name, &block)
      @head = Head.new(name, self, &block).tap do |head|
        @entities << head
      end
    end

    def value(name, &block)
      @value_objects << ValueObject.new(name, self, &block)
    end

    def get_binding
      binding
    end
  end
end