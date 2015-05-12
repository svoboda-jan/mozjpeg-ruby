# About

This repository contains the ruby library for easy interaction with MozJPEG compressor, an improved JPEG encoder (based on cjpeg).

Binaries of [MozJPEG 3.0](https://boomswaggerboom.wordpress.com/2014/12/30/mozjpeg-3-0-released/) for Mac OS X (64bit), Linux (64bit) and Windows are included in this gem.

This gem was successfully tested on the following systems: (test for binaries included in the source)

* Mac OS X 10.10 - ruby 2.2.2 (PNG + JPEG)
* Linux CentOS 6 - ruby 2.2.2 (JPEG only)
* Windows XP - ruby 2.0.0p645 (JPEG only)

Please report other systems that work, any problems or questions opening an issue on GitHub.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mozjpeg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mozjpeg

## Usage

```ruby
# check system support
Mozjpeg.supported? # true

# ask for location of (bundled) MozJPEG binary for current platform (Mac, Linux, Win)
Mozjpeg.cjpeg_path
# => /path/to/gems/bundled/cjpeg
# raises error if not supported

# compress JPEG file (accepts instances of File)
large_image = File.new('large.jpeg')
tiny_image = File.new('tiny.jpeg')

Mozjpeg.compress large_image, tiny_image

# to pass command line arguments to MozJPEG:
Mozjpeg.compress large_image, tiny_image, arguments: '-quality 70 -quant-table 2 -notrellis')

```

## [Paperclip](https://github.com/thoughtbot/paperclip)

This gem was made to be used with the [`paperclip-mozjpeg`](https://github.com/svoboda-jan/paperclip-mozjpeg) gem, which adds file processor to compress JPEG images uploaded using the [`paperclip`](https://github.com/thoughtbot/paperclip) gem.

## License

This gem is licensed under the MIT license.

[MozJPEG license](https://github.com/mozilla/mozjpeg/blob/master/LICENSE.txt)

The included JPEG fixture photo for tests is licenced under Creative Commons - CC0.

## Contributing

1. Fork it ( https://github.com/svoboda-jan/mozjpeg-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
