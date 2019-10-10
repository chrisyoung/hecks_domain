class HecksDomain
  module Generators
    class Domain < Thor::Group
      include Thor::Actions

      argument :domain_name, optional: true

      def self.source_root
        File.dirname(__FILE__) + '/../templates'
      end

      def folder_name
        domain_name.underscore
      end

      def write_domain_directory
        directory('%folder_name%')
      end
    end
  end
end
