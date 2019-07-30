require_relative 'file_maker/create_file'

class Domain
    class FileMaker
      attr_reader :domain

      def initialize(domain)
        @domain = domain
      end
      
      def dump
        write_and_change_dir(ENV['ROOT_PATH'] || 'lib')
        dump_helpers
        dump_support
        dump_domain
        dump_aggregates
        dump_spec
      end

      def dump_spec
        Dir.chdir '..'
        write_and_change_dir('spec')
        write_file(domain.spec_helper)
      end

      def dump_domain
        write_file(domain)
        write_and_change_dir(domain.folder_name)
      end

      def dump_helpers
        write_and_change_dir('helpers')
        write_file(domain.command_loader)
        write_file(domain.factory_loader)
        Dir.chdir '..'
      end

      def dump_support
        write_and_change_dir('support')
        write_file(domain.string_support)
        Dir.chdir '..'
      end

      def dump_domain_objects(aggregate)
        aggregate.domain_objects.each do |domain_object|
          write_file(domain_object)
          FileUtils.mkdir_p(domain_object.folder_name) 
          write_and_change_dir(domain_object.folder_name)
          FileUtils.mkdir_p('factories')
          write_file(domain_object.factories)
          Dir.chdir '..' and next unless domain_object.is_a?(Parser::Entity)
          write_file(domain_object.repository)
          Dir.chdir '..'
        end
      end

      def dump_aggregates
        domain.aggregates.each do |aggregate|
          write_file(aggregate)
          write_and_change_dir(aggregate.folder_name)
          write_file(aggregate.commands)
          dump_domain_objects(aggregate)
          Dir.chdir '..'
        end
        Dir.chdir '..'
      end
      
      def write_and_change_dir(name)
        FileUtils.mkdir_p name
        Dir.chdir name
      end

      def write_file(object)
        CreateFile.new.call(object)
      end
    end

end
