module Speaker
  class TtsImpl
    def create_mp3(text, options = {})
      raise "Must be implemented" 
    end
    
    def sanitize(text)
      text.gsub(/(!|\?|"|`|\\)/, ' ')
    end
  end
end

# Load tts implementations
Dir["#{File.dirname(__FILE__) + '/tts_impl/'}/**/*"].each do |tts_impl|
  require "#{tts_impl}"
end

