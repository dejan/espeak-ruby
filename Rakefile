# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'

desc 'Default: run tests'
task default: :test

desc 'Test espeak-ruby'
Rake::TestTask.new(test: :rubocop) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

RuboCop::RakeTask.new
