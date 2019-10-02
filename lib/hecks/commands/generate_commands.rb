# frozen_string_literal: true

require_relative 'generator'

class HecksDomain
  module Commands
    # Generate a Domainfile
    class GenerateCommands < Thor
      package_name 'Hecks'
      include Thor::Actions

      desc 'domain', ''
      method_option :name, type: :string
      def domain
        generator = Generator.new([options[:name]])
        generator.invoke_all
      end
    end
  end
end
