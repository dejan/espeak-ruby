# frozen_string_literal: true

require 'test_helper'

class VoiceTest < Test::Unit::TestCase
  include ESpeak

  def test_all
    all_voices = Voice.all
    assert all_voices.size.positive?
    assert %w[M F].include?(all_voices.first.gender)
  end

  def test_find_by_language
    voice = Voice.find_by_language('en')
    assert_equal 'en', voice.language
  end
end
