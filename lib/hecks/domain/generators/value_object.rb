class HecksDomain
  module Generators
    class ValueObject < Thor::Group
      include Thor::Actions

      attr_reader :aggregate_name, :domain_name, :domain_object_name, :domain, :aggregate, :domain_object

      def initialize(args)
        @domain = args[0]
        @aggregate = args[1]
        @domain_object = args[2]

        @domain_name = @domain.name.to_s.underscore
        @aggregate_name = @aggregate.name.to_s.underscore
        @domain_object_name = @domain_object.name.to_s.underscore
        super
      end

      argument :name

      def self.source_root
        File.dirname(__FILE__) + '/../templates'
      end

      def write_aggregate_directory
        directory('value_object', 'domain')
      end
    end
  end
end
