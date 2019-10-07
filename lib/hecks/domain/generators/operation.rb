class HecksDomain
  module Generators
    class Operation < Thor::Group
      include Thor::Actions

      attr_reader :aggregate_name, :domain_name, :operation_name, :domain_object_name, :domain, :aggregate, :domain_object, :operation

      def initialize(args, options)
        @domain = args[0]
        @aggregate = args[1]
        @domain_object = args[2]
        @operation = args[3]

        @domain_name = @domain.name.to_s.underscore
        @aggregate_name = @aggregate.name.to_s.underscore
        @domain_object_name = @domain_object.name.to_s.underscore
        @operation_name = @operation.name.to_s.underscore
        super(args, options)
      end

      argument :name

      def self.source_root
        File.dirname(__FILE__) + '/../templates'
      end

      def write_aggregate_directory
        directory('operation', 'domain')
      end
    end
  end
end
