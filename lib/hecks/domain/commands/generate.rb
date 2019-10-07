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
      method_option :skip_spec_generation, default: true, type: :boolean
      def domain_from_domain_file
        generate_domain_objects(domain_get)
        generate_domain_files(domain_get)
        generate_roots(domain_get)
        generate_operations(domain_get, options)
        generate_specs(domain_get, options)
      end

      private

      def generate_roots(domain)
        domain.aggregates.each do |aggregate|
          aggregate.domain_objects.each do |domain_object|
            next unless domain_object.is_a?(HecksDomain::Parser::Root)

            Generators::Root.new(
              [domain, aggregate, domain_object]
            ).invoke_all
          end
        end
      end

      def generate_specs(domain, options)
        domain.for_each_domain_object do |aggregate, domain_object|
          next unless domain_object.is_a?(HecksDomain::Parser::Root)

          Generators::Spec.new(
            [domain, aggregate, domain_object], options
          ).invoke_all
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
        domain.for_each_operation do |aggregate, domain_object, operation|
          Generators::Operation.new(
            [domain, aggregate, domain_object, operation],
            skip: options[:skip_operations]
          ).invoke_all
        end
      end

      def generate_domain_objects(domain)
        domain.for_each_domain_object do |aggregate, domain_object|
          generate_entity(domain, aggregate, domain_object)
          generate_value_object(domain, aggregate, domain_object)
        end
      end

      def generate_value_object(domain, aggregate, domain_object)
        return unless domain_object.is_a?(HecksDomain::Parser::ValueObject)

        Generators::ValueObject.new(
          [domain, aggregate, domain_object]
        ).invoke_all
      end

      def generate_entity(domain, aggregate, domain_object)
        return unless domain_object.is_a?(HecksDomain::Parser::Entity)

        Generators::Entity.new(
          [domain, aggregate, domain_object]
        ).invoke_all
      end
    end
  end
end
