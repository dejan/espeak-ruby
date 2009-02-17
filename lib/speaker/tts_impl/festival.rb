module Speaker
  class Festival < TtsImpl
    def create_mp3(text, opts = {})
      options = {:filename => "test.mp3"}
      options.merge!(opts)
      
      if system(%{echo "#{sanitize(text.to_s)}" | text2wave | lame --alt-preset cbr 16 -a --resample 11 --lowpass 5 -X3 - > #{options[:filename]}})
        options[:filename]
      else
        raise "Error while running festival. You don't seem to have festival or lame installed ..." 
      end
    end
  end
end
