require 'singleton'
require 'pry'
require 'erubis'
require 'thor'

require_relative 'hecks_domain/events'
require_relative 'hecks_domain/commands'
require_relative 'hecks_domain/top_level_methods'
require_relative 'hecks_domain/support'
require_relative 'hecks_domain/parser'
require_relative 'hecks_domain/builder'
require_relative 'hecks_domain/file_maker'

class HecksDomain
  def initialize(name, &block)
    @parser = Parser.new(name, &block)
    @file_maker = FileMaker
  end

  def build
    Builder.call(@parser.domain)
  end

  def dump
    @file_maker.new(@parser.domain).dump
  end

  def self.domain name, &block
    new name, &block
  end
end

