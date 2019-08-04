require_relative 'parser/domain'
require_relative 'parser/repository'
require_relative 'parser/aggregate'
require_relative 'parser/domain_object'
require_relative 'parser/value_field'
require_relative 'parser/entity_field'
require_relative 'parser/reference_field'
require_relative 'parser/spec_helper'
require_relative 'parser/fields'

class HecksDomain
  class Parser
    attr_accessor :domain
    
    def initialize(name, &block)
      @domain = Domain.new(name, &block)
    end
  end
end