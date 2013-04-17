# -*- mode: ruby; coding: utf-8 -*-

require File.expand_path('../config/application', __FILE__)
RailsApp::Application.load_tasks

require 'rubygems'
require 'rspec/core'
require 'rspec/core/rake_task'

task :spec do
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.rspec_opts = ["-c","-fs"]
    spec.pattern = FileList['spec/**/*_spec.rb']
  end
end

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "twitter_viewer"
  gem.homepage = ""
  gem.license = ""
  gem.summary = %Q{twitter_viewer}
  gem.description = %Q{Twitter Viewer}
  gem.email = "idnanashi@gmail.com"
  gem.authors = ["id774"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

if RUBY_VERSION >= '1.9.0'
  desc "Run RSpec code examples with simplecov"
  task :simplecov do
    ENV['COVERAGE'] = "on"
    Rake::Task[:spec].invoke
  end
else
  desc "Run RSpec code examples with rcov"
  RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
    exclude_files = [
      "gems",
    ]
    spec.rcov_opts = ['--exclude', exclude_files.join(",")]
    spec.rcov = true
  end
end
