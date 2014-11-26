require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

if RUBY_PLATFORM != 'java'
  require 'rake/extensiontask'
  Rake::ExtensionTask.new 'c_clock' do |ext|
    ext.ext_dir = 'ext/stoppur'
    ext.lib_dir = 'lib/stoppur/time'
  end
  task spec: :compile
end

task default: :spec
