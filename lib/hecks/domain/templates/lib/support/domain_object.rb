module DomainSupport
  module DomainObject
    def self.included(base)
      [
        DomainSupport::Factories::FactoryLoader,
        DomainSupport::Invariants::InvariantLoader
      ].each { |loader| base.include(loader) }
    end
  end
end