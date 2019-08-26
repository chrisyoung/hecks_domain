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
      dump_gemfile
      dump_spec
      dump_lib
      dump_aggregates
      dump_domain_objects
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
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.factories)
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.invariants)
          next unless domain_object.is_a?(Entity)
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.commands)
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", parse_file('queries.rb', 'domain_object/queries', domain_object.binding))
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", parse_file('events.rb', 'domain_object/events', domain_object.binding))
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", parse_file('subscribers.rb', 'domain_object/subscribers', domain_object.binding))
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/commands/", parse_file('save.rb', 'domain_object/commands/save', domain_object.binding))
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.repository)
        end
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
        write_file("domain/#{aggregate.folder_name}/", aggregate.head_file)
      end
    end

    def write_file(path, object)
      @create_file.call(path, object)
    end
  end
end
