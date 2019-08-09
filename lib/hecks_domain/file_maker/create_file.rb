class HecksDomain
  class FileMaker
    class CreateFile < Thor
      include Thor::Actions
      source_root(Dir[File.dirname(__FILE__) + '/../templates'])

      no_commands do
        def domain_lib
          directory('domain_support', 'lib')
        end

        def call(path, object)
          puts path.inspect
          create_file(path + object.file_name) do
            object.ruby_file + "\n"
          end
        end
      end
    end
  end
end