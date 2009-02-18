require 'rubygems'
require 'digest/sha1'
require File.dirname(__FILE__) + "/hash_ext.rb"

module ESpeak

  def espeak(text, opts = {})
    opts.symbolize_keys!
    options = {
      :v => 'en',   # use voice file of this name from espeak-data/voices
      :p => 50,     # pitch adjustment, 0 to 99
      :s => 170     # speed in words per minute, 80 to 370
    }.merge(opts)
    
    sanitized_text = text.gsub(/(!|\?|"|`|\\)/, ' ')
    filename = Digest::SHA1.hexdigest(textrm + options.to_s + ".mp3")

    if system(%$espeak "#{sanitized_text}" --stdout -v#{options[:v]} -p#{options[:p]} -s#{options[:s]} | lame -V2 - #{filename}$)
      filename
    else
      raise "Error while running espeak. You don't seem to have espeak or lame installed ..." 
    end
  end
end
