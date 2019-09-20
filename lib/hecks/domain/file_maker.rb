require_relative 'file_maker/create_file'

class HecksDomain
  class FileMaker
    attr_reader :domain

    def initialize(domain)
      @domain = domain
      @create_file = CreateFile.new
    end

    def dump
      dump_domain
      dump_events
      dump_gemfile
      dump_spec
      dump_lib
      dump_aggregates
      dump_domain_objects
    end

    def dump_events
      write_file('events/', parse_file('command_will_run.rb', 'events/command_will_run', domain.binding))
    end

    def dump_gemfile
      write_file('', parse_file(domain.folder_name + '.gemspec', 'gemspec', domain.binding))
    end

    def dump_spec
      write_file('spec/', domain.spec_helper)
    end

    def dump_domain
      write_file('lib/', domain)
    end

    def dump_domain_objects
      domain.aggregates.each do |aggregate|
        aggregate.domain_objects.each do |domain_object|
          write_file("domain/#{aggregate.folder_name}/", domain_object)
          dump_factories(domain_object, aggregate)
          next unless domain_object.is_a?(Entity)

          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.repository)
          dump_operations(domain_object, aggregate)
        end
      end
    end

    def dump_factories(domain_object, aggregate)
      directory = "domain/#{aggregate.folder_name}/#{domain_object.folder_name}/factories/"
      file_name = 'build.rb'
      write_file(directory, parse_file(file_name, 'domain_object/build_factory', domain_object.binding))
    end

    def dump_operations(domain_object, aggregate)
      domain_object.operations_get.each do |operation|
        directory = "domain/#{aggregate.folder_name}/#{domain_object.folder_name}/commands/"
        file_name = "#{operation.name.to_s.underscore}.rb"
        if File.exist?(directory + file_name)
          puts '   ' + 'exist'.colorize(:light_blue) + '      ' + directory + file_name + ': ' + 'the command already exists, so skipping.'.colorize(:light_blue)
          next
        end

        write_file(directory, parse_file(file_name, 'domain_object/operation', operation.binding))
      end
    end

    def build_file(name, context)
      Erubis::Eruby.new(read_template(name)).result(context)
    end

    def read_template(name)
      File.open(File.dirname(__FILE__) + "/templates/#{name}.erb").read
    end

    def dump_lib
      CreateFile.new.domain_lib
    end

    def parse_file(file_name, template_name, binding)
      Struct.new(:file_name, :ruby_file)
        .new(file_name, build_file(template_name, binding))
    end

    def dump_aggregates
      domain.aggregates.each do |aggregate|
        write_file("domain/#{aggregate.folder_name}/", aggregate.root_file)
      end
    end

    def write_file(path, object)
      @create_file.call(path, object)
    end
  end
end
