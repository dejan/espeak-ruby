# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name     = 'espeak-ruby'
  gem.version  = '1.1.0'

  gem.summary     = 'espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files'
  gem.description = 'espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files'

  gem.author   = 'Dejan Simic'
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'https://github.com/dejan/espeak-ruby'
  gem.license  = 'MIT'

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")

  gem.required_ruby_version = '>= 2.5.0'

  gem.add_development_dependency 'rake', '~> 13.0.6'
  gem.add_development_dependency 'rubocop', '~> 1.23'
  gem.add_development_dependency 'test-unit', '~> 3.5'
  gem.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
