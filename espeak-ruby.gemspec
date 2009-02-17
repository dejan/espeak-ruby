# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "espeak-ruby"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dejan Simic"]
  s.date = %q{2009-02-17}
  s.description = %q{espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files.}
  s.email = %q{desimic@gmail.com}
  s.files = ["LICENCE", "README.rdoc", "lib/espeak-ruby.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/dejan/espeak-ruby}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{espeak-ruby}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files. }
end
