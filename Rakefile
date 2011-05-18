require 'rake'
require 'rspec/core/rake_task'
 
desc 'Default: run specs.'
task :default => :spec
 
desc 'Run the specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
end

desc 'Run the specs'
RSpec::Core::RakeTask.new(:rcov) do |t|
  t.pattern = 'spec/*_spec.rb'
  t.verbose = true
  t.rcov = true
end