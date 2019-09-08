Gem::Specification.new do |s|
  s.name        = 'hecks_domain'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = '3DSL'
  s.description = 'A Domain Specific Language for generating Domain Driven Designs'
  s.authors     = ['Hecks Domain Developer']
  s.email       = 'dev@hecks_domain.com'
  s.files       = Dir['lib/**/*.rb', 'lib/**/*.erb']
  s.homepage    = 'http://www.example.com'

  s.add_runtime_dependency 'erubis'
  s.add_runtime_dependency 'thor'
end