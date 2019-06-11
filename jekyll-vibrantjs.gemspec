# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-vibrantjs/version"
Gem::Specification.new do |spec|
  spec.name          = "jekyll-vibrantjs"
  spec.summary       = "Extract image colors to CSS"
  spec.description   = "Jekyll plugin to generate CSS overrides based on Vibrant.js colors extracted from a given image"
  spec.version       = Jekyll::VibrantJS::VERSION
  spec.authors       = ["Nick Pettazzoni"]
  spec.email         = ["pettazz@gmail.com"]
  spec.homepage      = "https://github.com/warrantynowvoid/jekyll-vibrantjs"
  spec.licenses      = ["Nonstandard"]
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!) }
  spec.require_paths = ["lib"]
  spec.add_dependency "jekyll", "~> 3.0"
end