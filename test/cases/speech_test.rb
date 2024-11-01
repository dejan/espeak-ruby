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

  def test_save_with_bytes
    FileUtils.rm_rf('test/tmp')
    FileUtils.mkdir_p('test/tmp')
    bytes = Speech.new('Hello!').bytes_wav
    assert Speech.new('').save('test/tmp/test_bytes.mp3', bytes)
    assert File.exist?('test/tmp/test_bytes.mp3'), 'Mp3 file not generated'
    FileUtils.rm_rf('test/tmp')
  end

end
