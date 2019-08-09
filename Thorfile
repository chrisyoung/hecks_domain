require_relative 'lib/hecks_domain'

# A CLI interface for generating domains
class HecksDomain < Thor
  desc 'new', 'Create a new domain'
  HECKS_FILE_NAME = 'Hecksfile'.freeze

  def new
    unless File.file?(HECKS_FILE_NAME)
      puts "Missing Hecksfile - are you in a domain project?"
      return
    end

    instance_eval(File.open(HECKS_FILE_NAME).read).tap do |domain|
      domain.build
      domain.dump
    end
  end
end
