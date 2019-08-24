Gem::Specification.new do |s|
  s.name        = 'foo_bar'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Foo Bar'
  s.description = 'A Foo has many Bars.  A domain with no commands or factories so its no problem to destroy and re-generate'
  s.authors     = ["Chris Young"]
  s.email       = 'foobar@example.com'
  s.files       = Dir['lib/**/*.rb', 'domain/**/*.rb']
  s.homepage    = 'http://www.example.com'
end
