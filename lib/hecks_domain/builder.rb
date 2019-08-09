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
      domain.ruby_file = build_file('domain', domain.binding)
      domain.spec_helper.ruby_file = build_file('spec_helper', domain.binding)
      domain.aggregates.each do |aggregate|
        aggregate.head_file.ruby_file = build_file('head', aggregate.binding)
        aggregate.domain_objects.each do |domain_object|
          domain_object.commands.ruby_file = build_file('domain_object/commands', domain_object.binding)
          domain_object.ruby_file = build_file('domain_object', domain_object.binding)
          domain_object.factories.ruby_file = build_file('domain_object/factories', domain_object.binding)
          domain_object.repository.ruby_file  = build_file('repository', domain_object.binding)
          domain_object.invariants.ruby_file  = build_file('invariants', domain_object.binding)
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