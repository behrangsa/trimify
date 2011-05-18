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
  t.rcov = true
  t.rcov_opts = %[-Ilib -Ispec --exclude "gems/*,spec/fixtures,spec/spec_helper.rb,spec/nilify_spec.rb"]
end