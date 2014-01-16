Gem::Specification.new do |gem|
  gem.name = 'espeak-ruby'
  gem.version = '1.0.1'
  gem.date = '2013-01-16'

  gem.summary = "espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files"
  gem.description = "espeak-ruby is small Ruby API for utilizing ‘espeak’ and ‘lame’ to create Text-To-Speech mp3 files"
  
  gem.authors  = ['Dejan Simic']
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'http://github.com/dejan/espeak-ruby'

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
end
