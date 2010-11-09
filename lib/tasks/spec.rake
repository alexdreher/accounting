require 'rake'
require "rspec/core/rake_task" # RSpec 2.0

namespace :spec do 
  desc "Run specs with RCov" 
  RSpec::Core::RakeTask.new('rcov') do |t|
    t.pattern = 'spec/**/*_spec.rb'    
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/}
  end 
end