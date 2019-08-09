class HecksDomain
  class FileMaker
    # Thorfile gives you feedback about overwriting generated files
    # like:
    #
    # Overwrite /foo? (enter "h" for help) [Ynaqdhm] h
    # Y - yes, overwrite
    # n - no, do not overwrite
    # a - all, overwrite this and all others
    # q - quit, abort
    # d - diff, show the differences between the old and the new
    # h - help, show this help
    # m - merge, run merge tool
    class CreateFile < Thor
      include Thor::Actions
      source_root(Dir[File.dirname(__FILE__) + '/../templates'])

      no_commands do
        def domain_lib
          directory('domain_support', 'lib')
        end

        def call(path, object)
          create_file(path + object.file_name) do
            object.ruby_file + "\n"
          end
        end
      end
    end
  end
end