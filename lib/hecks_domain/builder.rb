class HecksDomain
  class Builder
    include Singleton

    def self.call(domain)
      instance.build(domain)
    end

    def initialize
      @files = []
    end

    def build(domain)
      domain.ruby_file = build_file('domain', domain.get_binding)
      domain.spec_helper.ruby_file = build_file('spec_helper', domain.get_binding)
      domain.command_loader.ruby_file = build_file('helpers/command_loader', domain.get_binding)
      domain.repository_helper.ruby_file = build_file('helpers/repository', domain.get_binding)
      domain.factory_loader.ruby_file = build_file('helpers/factory_loader', domain.get_binding)
      domain.string_support.ruby_file = build_file('support/string', domain.get_binding)
      domain.aggregates.each do |aggregate|
        aggregate.ruby_file = build_file('aggregate', aggregate.get_binding)
        aggregate.domain_objects.each do |domain_object|
          domain_object.commands.ruby_file = build_file('domain_object/commands', domain_object.get_binding)
          domain_object.ruby_file = build_file('domain_object', domain_object.get_binding)
          domain_object.factories.ruby_file = build_file('domain_object/factories', domain_object.get_binding)
          domain_object.repository.ruby_file  = build_file('repository', domain_object.get_binding)
        end
      end

      self
    end

    def build_file(name, context)
      Erubis::Eruby.new(read_template(name)).result(context).tap do |file|
        @files << file
      end
    end

    def read_template(name)
      File.open(File.dirname(__FILE__) + "/templates/#{name}.erb").read
    end
  end
end