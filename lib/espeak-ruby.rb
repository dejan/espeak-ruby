require 'rubygems'
require 'active_support'

module ESpeak
  def espeak(text, opts = {})

    options = {:pitch => 30, :speed => 100, :filename => "test.mp3", :lang => 'en'}
    opts.symbolize_keys!
    options.merge!(opts)
    sanitized_text = text.gsub(/(!|\?|"|`|\\)/, ' ')

    if system(%$espeak "#{sanitized_text}" --stdout -v#{options[:lang]} -p#{options[:pitch]} -s#{options[:speed]} | lame -V2 - #{options[:filename]}$)
      options[:filename]
    else
      raise "Error while running espeak. You don't seem to have espeak or lame installed ..." 
    end

  end
end
