require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "espeak-ruby"
    s.summary = %{espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files}
    s.email = "desimic@gmail.com"
    s.homepage = "http://github.com/dejan/espeak-ruby"
    s.description = "espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files"
    s.authors = ["Dejan Simic"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc 'Run all specs'
task :spec do
  system('spec spec')
end

desc 'Default: run specs.'
task :default => :spec

