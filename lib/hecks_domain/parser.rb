require_relative 'domain'

class HecksDomain
  class Parser
    attr_accessor :domain
    
    def initialize(name, &block)
      @domain = HecksDomain::Domain.new(name, &block)
    end
  end
end