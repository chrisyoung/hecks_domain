class Domain
  class Parser
    module FileMaker
      def self.dump(parser)
        File.open(parser.file_name, 'w') do |file|
          file.write(parser.ruby_file + "\n")
        end
        FileUtils.mkdir_p(parser.folder_name)
        
        parser.aggregates.each do |aggregate|
          File.open(parser.folder_name + "/" + aggregate.file_name, 'w') do |file|
            file.write(aggregate.ruby_file + "\n")
          end
          FileUtils.mkdir_p(parser.folder_name + "/" + aggregate.folder_name)
          
          aggregate.domain_objects.each do |domain_object|
            FileUtils.mkdir_p(parser.folder_name + "/" + aggregate.folder_name + '/' + domain_object.folder_name) if domain_object.is_a?(Entity)
            File.open(parser.folder_name + "/" + aggregate.folder_name + "/" + domain_object.file_name, 'w') do |file|
              file.write(domain_object.ruby_file + "\n")
            end
            File.open(parser.folder_name + "/" + aggregate.folder_name + "/" + domain_object.folder_name + '/repository.rb', 'w') do |file|
              file.write(domain_object.repository_file + "\n")
            end if domain_object.is_a?(Entity)
          end
        end
      end    
    end
  end
end