require_relative 'domain/domain'
require_relative 'domain/repository'
require_relative 'domain/aggregate'
require_relative 'domain/domain_object'
require_relative 'domain/value_field'
require_relative 'domain/entity_field'
require_relative 'domain/reference_field'
require_relative 'domain/spec_helper'
require_relative 'domain/fields'

class HecksDomain
  class Parser
    attr_accessor :domain
    
    def initialize(name, &block)
      @domain = Domain.new(name, &block)
    end
  end
end