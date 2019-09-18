class HecksDomain
  class Aggregate
    attr_reader :domain, :name, :domain_objects
    attr_accessor :ruby_file, :root_file

    def initialize(name, domain, &block)
      @name = name
      @entities = []
      @value_objects = []
      @root_file = RootFile.new
      @domain = domain
      instance_eval(&block)
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

    def folder_name
      name.to_s.underscore
    end

    def root(name, &block)
      @root = Root.new(name, self, &block).tap do |root|
        @entities << root
      end
    end

    def value(name, &block)
      @value_objects << ValueObject.new(name, self, &block)
    end

    def binding
      super
    end
  end
end