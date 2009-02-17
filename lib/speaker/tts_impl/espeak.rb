module Speaker
  class Espeak < TtsImpl
    def create_mp3(text, opts = {})
      options = {:pith => 30, :speed => 100, :filename => "test.mp3"}
      options.merge!(opts)

      if system(%{espeak "#{sanitize(text)}" --stdout -vsr -p#{options[:pitch]} -s#{options[:speed]} | lame -V2 - #{options[:filename]}})
        options[:filename]
      else
        raise "Error while running espeak. You don't seem to have espeak or lame installed ..." 
      end
    end
  end
end
