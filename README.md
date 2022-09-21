# espeak-ruby

espeak-ruby is a small Ruby API for utilizing [espeak](http://espeak.sourceforge.net) and [lame](http://lame.sourceforge.net/) to create Text-To-Speech mp3 files or just speak (without saving). See [live demo](https://espeak.rors.org/).

## Install

Add _espeak-ruby_ to Gemfile

```ruby
gem "espeak-ruby", require: "espeak"
```

## Examples

```ruby
# Speaks "YO!"
speech = ESpeak::Speech.new("YO!")
speech.speak # invokes espeak

# Creates hello-de.mp3 file
speech = ESpeak::Speech.new("Hallo Welt", voice: "de")
speech.save("hello-de.mp3") # invokes espeak + lame

# Lists voices
ESpeak::Voice.all.map { |v| v.language } # ["af", "bs", "ca", "cs", "cy", "da", "de", "el", "en", "en-sc", "en-uk", "en-uk-north", "en-uk-rp", "en-uk-wmids", "en-us", "en-wi", "eo", "es", "es-la", "fi", "fr", "fr-be", "grc", "hi", "hr", "hu", "hy", "hy", "id", "is", "it", "jbo", "ka", "kn", "ku", "la", "lv", "mk", "ml", "nci", "nl", "no", "pap", "pl", "pt", "pt-pt", "ro", "ru", "sk", "sq", "sr", "sv", "sw", "ta", "tr", "vi", "zh", "zh-yue"]

# Find particular voice
ESpeak::Voice.find_by_language('en') #<ESpeak::Voice:0x007fe1d3806be8 @language="en", @name="default", @gender="M", @file="default">
```

## Features

Currently only subset of espeak features is supported.

```ruby
:voice     => 'en'    # use voice file of this name from espeak-data/voices
:pitch     => 50      # pitch adjustment, 0 to 99
:speed     => 170     # speed in words per minute, 80 to 370
:capital   => 170     # increase emphasis (pitch) of capitalized words, 1 to 40 (for natural sound, can go higher)
:amplitude => 150     # amplitude (volume) adjustment, 0 to 200
```

These are default values, and they can be easily overridden:

```ruby
Speech.new("Zdravo svete", voice: "sr", pitch: 90, speed: 200).speak
```

## Installing dependencies

### OS X

    brew install espeak lame

### Ubuntu

    apt-get install espeak lame

## Licence

espeak-ruby is released under the [MIT License](/MIT-LICENSE).
