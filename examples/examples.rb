require File.dirname(__FILE__) + '/../lib/speaker'

mp3_file = Speaker::Mp3.create "Hello World", :filename => "hello_world.mp3", :pitch => 30, :speed => 100, :voice => :en
puts "Successfully created #{mp3_file}!"
