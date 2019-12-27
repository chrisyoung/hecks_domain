Gem::Specification.new do |s|
  s.name        = 'hecks-domain'
  s.version     = '0.2.0'
  s.licenses    = ['MIT']
  s.summary     = '3DSL'
  s.description = 'A Domain Specific Language for generating Domain Driven Designs'
  s.authors     = ['Hecks Domain Developer']
  s.email       = 'dev@hecks_domain.com'
  s.files       = Dir['lib/**/*']
  s.homepage    = 'http://www.example.com'

  s.add_dependency 'colorize', '~> 0.8'
  s.add_dependency 'erubis', '~> 2.7'
  s.add_dependency 'thor', '~> 0.20'
end
