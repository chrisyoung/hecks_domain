class HecksDomain
  module Commands
    class Generator < Thor::Group
      include Thor::Actions

      argument :domain_name

      def self.source_root 
        File.dirname(__FILE__) + '/../domain/templates'
      end

      def write_domain_file
        directory('%domain_name%')
      end
    end
  end
end
