class Domain
  class Parser
    module FileMaker
      def self.dump(domain)
        write_and_change_dir(ENV['ROOT_PATH'] || 'lib')
        write_and_change_dir('helpers')
        write_file(domain.command_loader)
        Dir.chdir '..'
        write_and_change_dir('support')
        write_file(domain.string_support)
        Dir.chdir '..'
        write_file(domain)
        write_and_change_dir(domain.folder_name)
        dump_aggregates(domain)
        Dir.chdir '../..'
        write_and_change_dir('spec')
        write_file(domain.spec_helper)
      end    

      def self.dump_domain_objects(aggregate)
        aggregate.domain_objects.each do |domain_object|
          write_file(domain_object)
          next unless domain_object.is_a?(Entity)
          
          FileUtils.mkdir_p(domain_object.folder_name) 
          write_and_change_dir(domain_object.folder_name)
          write_file(domain_object.repository)
          Dir.chdir '..'
        end
      end

      def self.dump_aggregates(domain)
        domain.aggregates.each do |aggregate|
          write_file(aggregate)
          write_and_change_dir(aggregate.folder_name)
          write_file(aggregate.commands)
          dump_domain_objects(aggregate)
          Dir.chdir '..'
        end
      end
      
      def self.write_and_change_dir(name)
        FileUtils.mkdir_p name
        Dir.chdir name
      end

      def self.write_file(object)
        File.open(object.file_name, 'w') do |file|
          file.write(object.ruby_file + "\n")
        end
      end
    end
  end
end