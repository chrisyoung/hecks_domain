require_relative 'lib/hecks_domain'
# ENV['THOR_MERGE'] = 'vscode'
class HecksDomain < Thor
  
  desc "new", "Create a new domain"
  def new
    eval(File.open('Hecks').read).tap do |domain|
      domain.build
      domain.dump
    end
  end
end
