require 'rubygems'
require 'sinatra'
require 'speaker'

get '/speaker' do
  text = params[:text]
  
  [200, {'Content-type' => 'audio/mpeg'}, File.read(Speaker::Mp3.create(text))]
end