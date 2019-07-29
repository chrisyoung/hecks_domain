require_relative 'lib/domain'
class HecksDomain < Thor
  desc "new", "Create a new domain"
  def new
    domain = eval(File.open('Hecks').read)
    domain.build
    domain.dump
  end
end
