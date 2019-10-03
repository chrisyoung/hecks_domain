class HecksDomain
  module Generators
    class Domain < Thor::Group
      include Thor::Actions

      argument :domain_name

      def self.source_root
        File.dirname(__FILE__) + '/../templates'
      end

      def write_domain_directory
        directory('%domain_name%')
      end
    end
  end
end
