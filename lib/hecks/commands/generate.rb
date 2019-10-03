# frozen_string_literal: true

class HecksDomain
  module Commands
    # Generate a Domainfile
    class Generate < Thor
      package_name 'Hecks'
      include Thor::Actions

      HECKS_FILE_NAME = 'Domainfile'

      def self.source_root
        File.dirname(__FILE__) + '/../templates'
      end

      desc 'new', 'Generate an empty domain project'
      argument :domain_name, optional: true
      def new
        if domain_file
          generate_domain_objects(domain_get)
          generate_operations(domain_get)
          generate_domain_files(domain_get)
        else
          Generators::Domain.new([domain_name]).invoke_all
        end
      end

      private

      def domain_get
        instance_eval(domain_file).domain
      end

      def domain_file
        return unless File.exist?(HECKS_FILE_NAME)

        File.open(HECKS_FILE_NAME).read
      end

      def generate_domain_files(domain)
        Generators::DomainFiles.new([domain]).invoke_all
      end

      def generate_operations(domain)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            domain_object.operations_get.each do |operation|
              Generators::Operation.new(
                [domain, aggregate, domain_object, operation]
              ).invoke_all
            end
          end
        end
      end

      def generate_domain_objects(domain)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            Generators::DomainObject.new(
              [domain, aggregate, domain_object]
            ).invoke_all
          end
        end
      end
    end
  end
end