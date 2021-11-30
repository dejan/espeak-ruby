# frozen_string_literal: true

require 'test_helper'
require 'fileutils'

class SpeechTest < Test::Unit::TestCase
  include ESpeak

  def test_save
    FileUtils.rm_rf('test/tmp')
    FileUtils.mkdir_p('test/tmp')
    assert Speech.new('Hello!').save('test/tmp/test.mp3')
    assert File.exist?('test/tmp/test.mp3'), 'Mp3 file not generated'
    FileUtils.rm_rf('test/tmp')
  end
end
