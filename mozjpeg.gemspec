# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mozjpeg/version'

Gem::Specification.new do |spec|
  spec.name          = "mozjpeg"
  spec.version       = Mozjpeg::VERSION
  spec.authors       = ["Jan Svoboda"]
  spec.email         = ["jan@mluv.cz"]

  spec.summary       = %q{JPEG and PNG compression using MozJPEG}
  spec.description   = %q{JPEG and PNG compression using MozJPEG, with included binaries.}
  spec.homepage      = "https://github.com/svoboda-jan/mozjpeg-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "minitest", "~> 5.4.2"

  spec.add_dependency "os", ">= 0.9.6", "< 2.0"
end
