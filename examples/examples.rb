require File.dirname(__FILE__) + '/../lib/speaker'

mp3_file = Speaker::Mp3.create "Guten Tag", :lang => :de
puts "Successfully created #{mp3_file}!"