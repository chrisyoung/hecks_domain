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
      dump_aggregates
      dump_domain_objects
      dump_lib
      dump_spec
    end

    def dump_spec
      write_file('spec/', domain.spec_helper)
    end

    def dump_domain
      write_file('', domain)
    end

    def dump_domain_objects
      domain.aggregates.each do |aggregate|
        aggregate.domain_objects.each do |domain_object|
          write_file("domain/#{aggregate.folder_name}/", domain_object)
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.commands)
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.factories)
          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.invariants)
          next unless domain_object.is_a?(Entity)

          write_file("domain/#{aggregate.folder_name}/#{domain_object.folder_name}/", domain_object.repository)
        end
      end
    end

    def dump_lib
      CreateFile.new.domain_lib
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
