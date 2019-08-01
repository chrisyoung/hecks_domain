require_relative 'domain/command_loader'
require_relative 'domain/factory_loader'
require_relative 'domain/repository_helper'
require_relative 'domain/string_support'

class HecksDomain
  class Parser
    class Domain
      attr_reader :name, :aggregates, :spec_helper, :string_support, 
                  :command_loader, :repository_helper, :factory_loader
      attr_accessor :ruby_file

      def initialize(name, &block)
        @name = name
        @aggregates = []
        @spec_helper = SpecHelper.new
        @command_loader = CommandLoader.new
        @repository_helper = RepositoryHelper.new
        @factory_loader = FactoryLoader.new
        @string_support = StringSupport.new

        instance_eval(&block)
      end

      def aggregate(name, &block)
        @aggregates << Aggregate.new(name, self, &block)
      end

      def get_binding
        binding
      end

      def file_name
        folder_name + '.rb'
      end

      def folder_name
        @name.to_s.downcase
      end
    end
  end
end