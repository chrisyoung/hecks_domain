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
      if File.exist?('spec/spec_helper.rb')
        puts '        ' + 'skip'.colorize(:light_yellow) + '       spec/spec_helper.rb'
        return
      end

      write_file('spec/', parse_file('spec_helper.rb', 'spec_helper', domain.binding))
    end

    def dump_domain
      write_file('lib/', parse_file("#{domain.name.underscore}.rb", 'domain', domain.binding))
    end

    def dump_domain_objects
      domain.aggregates.each do |aggregate|
        aggregate.domain_objects.each do |domain_object|
          write_file("domain/#{aggregate.folder_name}/", parse_file("#{domain_object.name.to_s.underscore}.rb", 'domain_object', domain_object.binding))
          dump_factories(domain_object, aggregate)
          next unless domain_object.is_a?(Entity)

          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", parse_file('repository.rb', 'repository', domain_object.binding))
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
          puts '        ' + 'skip'.colorize(:light_yellow) + '       ' + directory + file_name
          next
        end

        write_file(directory, parse_file(file_name, 'domain_object/operation', operation.binding))
      end
    end

    def dump_aggregates
      domain.aggregates.each do |aggregate|
        write_file('events/', parse_file('command_will_run.rb', 'events/command_will_run', domain.binding))
        write_file("domain/#{aggregate.folder_name}/",  parse_file('root.rb', 'root', aggregate.binding))
      end
    end

    private

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
      Struct.new(:file_name, :ruby_file).new(
        file_name, build_file(template_name, binding)
      )
    end

    def write_file(path, object)
      @create_file.call(path, object)
    end
  end
end
