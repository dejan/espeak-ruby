module ESpeak
  class Speech
    attr_reader :options, :text
  
    # filename - The file that will be generated
    # options  - Posible key, values
    #    :voice     - use voice file of this name from espeak-data/voices. ie 'en', 'de', ...
    #    :pitch     - pitch adjustment, 0 to 99
    #    :speed     - speed in words per minute, 80 to 370
    #    :quiet     - remove printing to stdout. Affects only lame (default false) 
    #    
    def initialize(text, options={})
      @text = text
      @options = options
    end

    # Generates mp3 file as a result of 
    # Text-To-Speech conversion. 
    # 
    def save!(filename)
      execute_system_command(filename, default_options.merge(symbolize_keys(options)))
    end

    # espeak dies handling some chars
    # this function sanitizes text
    #
    def sanitized_text
      @text.gsub(/(!|\?|"|`|\\)/, ' ').strip
    end

    private

    # Although espeak itself has default options 
    # I'm defining them here for easier generating
    # command (with simple hash.merge)
    #
    def default_options
      { :voice => 'en',
        :pitch => 50,
        :speed => 170,
        :quiet => true }
    end

    def espeak_command(options)
      %|espeak "#{sanitized_text}" --stdout -v#{options[:voice]} -p#{options[:pitch]} -s#{options[:speed]}|
    end

    def lame_command(filename, options)
      "lame -V2 - #{filename} #{'--quiet' if options[:quiet] == true}"
    end

    def execute_system_command(filename, options)
      system(
        espeak_command(options) + " | " + lame_command(filename, options))
    end

    def symbolize_keys(hash)
      hash.inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = value
        options
      end
    end
  end
end
