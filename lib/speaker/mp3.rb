require 'rubygems'
require 'active_support'

module Speaker
  class Mp3
    def self.create(text, options = {})
      tts = options[:tts] || :espeak
      tts_impl = "Speaker::#{tts.to_s.camelize}".constantize.new
      tts_impl.create_mp3(text, options)
    end
  end
end