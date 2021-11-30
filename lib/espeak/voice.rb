# frozen_string_literal: true

module ESpeak
  # A voice that will be used for `Speech`
  class Voice
    attr_reader :language, :name, :gender, :file

    def initialize(attributes)
      @language = attributes[:language]
      @name     = attributes[:name]
      @gender   = attributes[:gender]
      @file     = attributes[:file]
    end

    def self.all
      voices = []
      result = IO.popen('espeak --voices', &:read)
      result.each_line do |line|
        next unless line.start_with?(' ') # header

        row = line.split
        voices << Voice.new(language: row[1], gender: row[2], name: row[3], file: row[4])
      end
      voices.freeze
    end

    def self.find_by_language(lang)
      all.find { |v| v.language == lang.to_s }
    end
  end
end
