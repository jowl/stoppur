gemspec = Gem::Specification.new do |s|
  java = (RUBY_PLATFORM == 'java') && 'java'

  s.name        = 'stoppur'
  s.version     = '0.0.3'
  s.platform    = java || Gem::Platform::RUBY
  s.author      = 'Joel Segerlind'
  s.email       = 'joel@jowl.se'
  s.homepage    = 'https://github.com/jowl/stoppur'
  s.summary     = 'Simple time measurement'
  s.description = 'Simple time measurement, with monotonic clocks'
  s.license     = 'Apache License 2.0'

  s.add_development_dependency 'rake-compiler', '~> 0.9'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'simplecov', '~> 0.9'
  s.add_development_dependency 'timecop', '~> 0.7'

  s.files = Dir['lib/**/*.rb', 'ext/**/*.c']
  s.extensions << 'ext/stoppur/extconf.rb' unless java
end
