require 'colorize'
require 'singleton'
require 'erubis'
require 'thor'
require 'fileutils'

require_relative 'domain/support'
require_relative 'domain/parser'
require_relative 'domain/generators'
require_relative 'domain/commands'

class HecksDomain
  attr_reader :domain
  def initialize(name, &block)
    @domain = Parser.new(name, &block)
  end

  def self.parser(name, &block)
    new name, &block
  end
end
