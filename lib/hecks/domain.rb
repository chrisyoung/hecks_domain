require 'colorize'
require 'singleton'
require 'erubis'
require 'thor'
require 'fileutils'

require_relative 'domain/generator'
require_relative 'domain/top_level_methods'
require_relative 'domain/support'
require_relative 'domain/parser'
require_relative 'domain/file_maker'
require_relative 'commands/generate_commands'

class HecksDomain
  def initialize(name, &block)
    @parser = Parser.new(name, &block)
    @file_maker = FileMaker
  end

  def build
    FileMaker.new(@parser.domain).dump
  end

  def dump
    @file_maker.new(@parser.domain).dump
  end

  def generate_factory(_domain_object, _factory_name)
    raise @parser.domain.inspect
  end

  def self.domain name, &block
    new name, &block
  end
end
