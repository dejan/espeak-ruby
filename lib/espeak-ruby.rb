module Espeak
  class Mp3
    def self.create(text, opts = {})
      options = {:pith => 30, :speed => 100, :filename => "test.mp3"}
      options.merge!(opts)
      
      if system(%{espeak "#{sanitize(text)}" --stdout -vsr -p#{options[:pitch]} -s#{options[:speed]} | lame -V2 - #{options[:filename]}})
        options[:filename]
      else
        raise "Error while running espeak. You don't seem to have espeak or lame installed ..." 
      end
    end
  
    def self.sanitize(text)
      text.gsub(/(!|\?|"|`|\\)/, ' ')
    end
  end
end



