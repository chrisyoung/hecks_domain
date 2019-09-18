class HecksDomain
  class Operation
    attr_reader :name
    def initialize(name:, domain_object:)
      @name = name
      @domain_object = domain_object
    end

    def binding
      super
    end
  end
end