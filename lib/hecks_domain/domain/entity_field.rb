class HecksDomain
  class EntityField
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def as(name)
      @as = name
      self
    end

    def module_name
      @as
    end

    def initial_state
      name
    end

    def read_only=(value)
      @read_only = value
    end

    def read_only?
      @read_only
    end

    def optional?
      @optional
    end

    def attribute_name
      return name.to_s + ':' unless optional?
      name.to_s + ': nil'
    end
  end
end