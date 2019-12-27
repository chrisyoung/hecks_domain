module DomainSupport 
  module Root
    TYPES = [
      :services,
      :invariants,
      :queries, 
      :events,
      :subscribers,
      :repository
    ].freeze

    LOADERS = [
      Queries::QueryLoader,
      Repositories::RepositoryLoader,  
    ].freeze

    def self.included(base)
      TYPES.each do |name, root_path|
        path = [
          '../../app/', base.to_s.gsub('TrusonaDomain', '').underscore
        ].join('/')
        require_relative path + '/repository.rb' if name.to_s == 'repository' 

        Dir[File.dirname(__FILE__) + "/#{path}/" + name.to_s + '/*.rb']
          .each { |file| require_relative file }
      end
      
      LOADERS.each { |loader| base.include(loader) }
    end
  end
end