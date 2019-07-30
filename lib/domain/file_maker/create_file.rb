class HecksDomain
  class FileMaker
    class CreateFile < Thor
      include Thor::Actions

      no_commands do
        def call(object)
          create_file(object.file_name) do
            object.ruby_file + "\n"
          end
        end
      end
    end
  end
end