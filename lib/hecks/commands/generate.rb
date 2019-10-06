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

      desc 'domain', 'Generate domain objects from a Domainfile'
      method_option :skip_operations, default: true, type: :boolean
      def domain_from_domain_file
        generate_domain_objects(domain_get)
        generate_domain_files(domain_get)
        generate_roots(domain_get)
        generate_operations(domain_get, options)
        generate_specs(domain_get)
      end

      private

      def generate_roots(domain)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            next unless domain_object.is_a?(HecksDomain::Root)

            Generators::Root.new(
              [domain, aggregate, domain_object]
            ).invoke_all
          end
        end
      end

      def generate_specs(domain)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            next unless domain_object.is_a?(HecksDomain::Root)

            Generators::Spec.new(
              [domain, aggregate, domain_object]
            ).invoke_all
          end
        end
      end

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

      def generate_operations(domain, options)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            domain_object.operations_get.each do |operation|
              Generators::Operation.new(
                [domain, aggregate, domain_object, operation], skip: options[:skip_operations]
              ).invoke_all
            end
          end
        end
      end

      def generate_domain_objects(domain)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            if domain_object.is_a?(HecksDomain::Entity)
              Generators::Entity.new(
                [domain, aggregate, domain_object]
              ).invoke_all
            end

            next unless domain_object.is_a?(HecksDomain::ValueObject)

            Generators::ValueObject.new(
              [domain, aggregate, domain_object]
            ).invoke_all
          end
        end
      end
    end
  end
end
