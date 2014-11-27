require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubygems/package_task'

gemspec = Gem::Specification.load('stoppur.gemspec')
gemspec.platform = Gem::Platform::CURRENT

Gem::PackageTask.new(gemspec).define

if RUBY_PLATFORM != 'java'
  require 'rake/extensiontask'
  Rake::ExtensionTask.new('c_clock', gemspec) do |ext|
    ext.ext_dir = 'ext/stoppur'
    ext.lib_dir = 'lib/stoppur/time'
  end
  task spec: :compile
end

task default: :spec
