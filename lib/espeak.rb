# frozen_string_literal: true

# The main module for the ESpeak Ruby API.
module ESpeak
  autoload :Speech, 'espeak/speech'
  autoload :Voice,  'espeak/voice'
end

ESpeak::Voice.all
