# frozen_string_literal: true

require 'roda'
require 'espeak'

# Demo app for espeak-ruby
class Demo < Roda
  plugin :render
  plugin :static, ['/css', '/js']

  route do |r|
    r.root do
      @voices = ESpeak::Voice.all.sort_by(&:name)
      render('demo')
    end

    r.get 'tts' do
      print(r.params.inspect)
      response['Content-Type'] = 'audio/mpeg'
      ESpeak::Speech.new(r.params['text'], r.params).bytes
    end
  end
end
