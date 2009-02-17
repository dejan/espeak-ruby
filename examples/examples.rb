require File.dirname(__FILE__) + '/../lib/espeak-ruby'

include ESpeak
mp3_file = espeak("Guten Tag", :lang => :de)
puts "Successfully created #{mp3_file}!"