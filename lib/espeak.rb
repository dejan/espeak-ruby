# frozen_string_literal: true

module ESpeak
  autoload :Speech, 'espeak/speech'
  autoload :Voice,  'espeak/voice'
end

ESpeak::Voice.all
