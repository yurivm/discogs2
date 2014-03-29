# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'discogs2/version'

Gem::Specification.new do |spec|
  spec.name          = "discogs2"
  spec.version       = Discogs2::VERSION
  spec.authors       = ["yurivm"]
  spec.email         = ["yuri.veremeyenko@gmail.com"]
  spec.summary       = %q{A Ruby wrapper for the Discogs API v2. Json, no XML.}
  spec.description   = %q{A yet another Ruby wrapper based on the discogs gem by Andrew Buntine that uses JSON instead of XML}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

end
