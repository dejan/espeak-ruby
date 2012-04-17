require 'rubygems'
require File.dirname(__FILE__) + "/hash_ext.rb"

module ESpeak
  
  # 
  # Generates mp3 file as a result of Text-To-Speech conversion. 
  #
  # filename - The file that will be generated
  # options  - Posible key, values
  #    :voice     - use voice file of this name from espeak-data/voices. ie 'en', 'de', ...
  #    :pitch     - pitch adjustment, 0 to 99
  #    :speed     - speed in words per minute, 80 to 370
  #    :quiet     - remove printing to stdout. Affects only lame (default false) 
  #
  def espeak(filename, options)
    if execute_system_command(filename, prepare_options(options))
      nil
    else
      raise "Error while running espeak. You don't seem to have espeak or lame installed ..."
    end
  end

private

  def prepare_options(options)
    options.symbolize_keys!
    raise "You must provide value for :text key in options" unless options[:text]
    sanitize_text!(options[:text])
    default_espeak_options.merge(options)
  end

  # espeak has problems handling
  # some characters (it dies)
  #
  def sanitize_text!(text)
    text.gsub!(/(!|\?|"|`|\\)/, ' ')
  end

  # Although espeak itself has default options 
  # I'm defining them here for easier generating
  # command (with simple hash.merge)
  #
  def default_espeak_options
    { :voice => 'en',
      :pitch => 50,
      :speed => 170 }
  end

  def execute_system_command(filename, options)
    system([espeak_command(options), lame_command(filename, options)] * " | ")
  end

  def espeak_command(options)
    %|espeak "#{options[:text]}" --stdout -v#{options[:voice]} -p#{options[:pitch]} -s#{options[:speed]}|
  end

  def lame_command(filename, options)
    "lame -V2 - #{filename} #{'--quiet' if options[:quiet] == true}"
  end
end
