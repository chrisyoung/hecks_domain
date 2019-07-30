require 'singleton'
require 'pry'
require 'erubis'
require 'thor'

require_relative 'domain/top_level_methods'
require_relative 'domain/support'
require_relative 'domain/parser'
require_relative 'domain/builder'
require_relative 'domain/file_maker'

class Domain
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
    Domain.new name, &block
  end
end

