module DomainSupport 
  module Root
    TYPES = {
      services: 'app',
      invariants: 'app',
      queries: 'app', 
      events: 'app',
      subscribers: 'app',
      repository: 'app'
    }.freeze

    LOADERS = [
      Queries::QueryLoader,
      Repositories::RepositoryLoader,  
    ].freeze

    def self.included(base)
      TYPES.each do |name, root_path|
        path = [
          '../..', 
          root_path, 
          base.to_s.gsub('TrusonaDomain', '').underscore
        ].join('/')
        require_relative path + '/repository.rb' if name.to_s == 'repository' 

        Dir[File.dirname(__FILE__) + "/#{path}/" + name.to_s + '/*.rb']
          .each { |file| require_relative file }
      end
      
      LOADERS.each { |loader| base.include(loader) }
    end
  end
end