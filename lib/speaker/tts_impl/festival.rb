module Speaker
  class Festival < TtsImpl
    def create_mp3(text, opts = {})
      options = {:filename => "test.mp3"}
      options.merge!(opts)
      
      system(%{echo "#{sanitize(text.to_s)}" | text2wave | lame --alt-preset cbr 16 -a --resample 11 --lowpass 5 --athtype 2 -X3 - > #{options[:filename]} 2> /dev/null})
    end
  end
end
