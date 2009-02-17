require 'rubygems'
require 'digest/sha1'

module ESpeak

  def espeak(text, opts = {})
    opts.symbolize_keys!
    options = {
      :v => 'en',   # use voice file of this name from espeak-data/voices
      :p => 50,     # pitch adjustment, 0 to 99
      :s => 170     # speed in words per minute, 80 to 370
    }.merge(opts)
    
    sanitized_text = text.gsub(/(!|\?|"|`|\\)/, ' ')
    filename = Digest::SHA1.hexdigest(options.to_s)

    if system(%$espeak "#{sanitized_text}" --stdout -v#{options[:lang]} -p#{options[:pitch]} -s#{options[:speed]} | lame -V2 - #{filename}$)
      filename
    else
      raise "Error while running espeak. You don't seem to have espeak or lame installed ..." 
    end
  end

private

  def symbolize_keys
    inject({}) do |options, (key, value)|
      options[(key.to_sym rescue key) || key] = value
      options
    end
  end

  def symbolize_keys!
    self.replace(self.symbolize_keys)
  end

end
