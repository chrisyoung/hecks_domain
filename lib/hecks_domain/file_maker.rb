require_relative 'file_maker/create_file'

class HecksDomain
  class FileMaker
    attr_reader :domain

    def initialize(domain)
      @domain = domain
      @create_file = CreateFile.new
    end

    def dump
      dump_helpers
      dump_support
      dump_domain
      dump_aggregates
      dump_spec
    end

    def dump_spec
      write_file('spec/', domain.spec_helper)
    end

    def dump_domain
      write_file('lib/', domain)
    end

    def dump_helpers
      [domain.repository_helper].each do |file|
        write_file("lib/helpers/", file)
      end
    end

    def dump_support
      write_file("lib/support/", domain.string_support)
    end

    def dump_domain_objects(aggregate)
      aggregate.domain_objects.each do |domain_object|
        write_file("lib/#{aggregate.domain.folder_name}/#{aggregate.folder_name}/", domain_object)
        FileUtils.mkdir_p(domain_object.folder_name)
        FileUtils.mkdir_p('factories')
        write_file("lib/#{aggregate.domain.folder_name}/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.commands)
        write_file("lib/#{aggregate.domain.folder_name}/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.factories)
        next unless domain_object.is_a?(Entity)

        write_file("lib/#{aggregate.domain.folder_name}/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.repository)
      end
    end

    def dump_aggregates
      domain.aggregates.each do |aggregate|
        write_file("lib/#{aggregate.domain.folder_name}/", aggregate)
        dump_domain_objects(aggregate)
      end
    end

    def write_file(path, object)
      @create_file.call(path, object)
    end
  end
end
