require_relative 'lib/hecks_domain'

# A CLI interface for generating domains
class HecksDomain < Thor
  package_name "Hecks"
  HECKS_FILE_NAME = 'Domainfile'.freeze
  DOMAIN = instance_eval(File.open(HECKS_FILE_NAME).read)

  desc 'new', 'Create a new domain'
  def new
    unless File.file?(HECKS_FILE_NAME)
      puts "Missing Domainfile - are you in a domain project?"
      return
    end

    instance_eval(File.open(HECKS_FILE_NAME).read).tap do |domain|
      DOMAIN.build
      DOMAIN.dump
    end
  end

  desc 'generate_factory', 'Add a factory to a domain object'
  method_options domain_object: :string
  method_options factory_name: :string

  def generate_factory
    DOMAIN.generate_factory(options[:domain_object], options[:factory_name])
  end
end
