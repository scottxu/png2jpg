# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'png2jpg/version'

Gem::Specification.new do |spec|
  spec.name          = "png2jpg"
  spec.version       = Png2jpg::VERSION
  spec.authors       = ["scottxu"]
  spec.email         = ["xubingchao@gmail.com"]
  spec.summary       = %q{png convert to jpg}
  spec.description   = %q{png convert to jpg}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
