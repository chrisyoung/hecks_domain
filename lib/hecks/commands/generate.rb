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

      desc 'generate_from_domain_file', ''
      def generate_from_domain_file
        instance_eval(domain_file).domain.tap do |domain|
          generate_domain_objects(domain)
          generate_operations(domain)
        end
      end

      desc 'new_domain', ''
      method_option :name, type: :string
      def new_domain
        Generators::Domain.new([options[:name]]).invoke_all
      end

      private

      def domain_file
        File.open(HECKS_FILE_NAME).read
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