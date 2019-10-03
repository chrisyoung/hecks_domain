class HecksDomain
  module Generators
    class DomainFiles < Thor::Group
      include Thor::Actions

      attr_reader  :domain_name, :domain, :gemspec

      def initialize(args)
        @domain = args.first
        @gemspec = @domain.gemspec

        @domain_name = @domain.name.to_s.underscore
        super
      end

      argument :name

      def self.source_root
        File.dirname(__FILE__) + '/../templates'
      end

      def write_gemspec
        template('%domain_name%.gemspec.tt')
      end
    end
  end
end
