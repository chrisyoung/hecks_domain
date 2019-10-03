require 'colorize'
require 'singleton'
require 'erubis'
require 'thor'
require 'fileutils'

require_relative 'domain/top_level_methods'
require_relative 'domain/support'
require_relative 'domain/parser'
require_relative 'generators'
require_relative 'commands'

class HecksDomain
  attr_reader :domain
  def initialize(name, &block)
    @parser = Parser.new(name, &block)
    @domain = @parser.domain
  end

  def self.domain(name, &block)
    new name, &block
  end
end
