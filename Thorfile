require_relative 'lib/hecks_domain'

# A CLI interface for generating domains
class HecksDomain < Thor
  desc 'new', 'Create a new domain'
  def new
    raise 'Missing Hecks file in current directory' unless File.file?('Hecks')

    instance_eval(File.open('Hecks').read).tap do |domain|
      domain.build
      domain.dump
    end
  end
end
