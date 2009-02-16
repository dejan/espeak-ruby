require File.dirname(__FILE__) + "/tts_impl/espeak"
require File.dirname(__FILE__) + "/tts_impl/festival"

module Speaker
  class Mp3
    def self.create(text, options = {})
      Speaker::Espeak::Mp3.create(text, options)
    end
  end
end
